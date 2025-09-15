<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\ProductVariation;
use Darryldecode\Cart\Facades\CartFacade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class CheckoutController extends Controller
{
    public function index()
    {
        // Generate or retrieve guest ID
        $guestId = Cookie::get('guest_id') ?? Str::uuid()->toString();
        Cookie::queue(Cookie::make('guest_id', $guestId, 60 * 24 * 30)); // 30 days

        $cart = CartFacade::session($guestId);
        $cartItems = $cart->getContent();

        // Ensure the cart is not empty
        if ($cartItems->isEmpty()) {
            return redirect()->back()->with('error', 'Your cart is empty.');
        }

        return view('page.checkout', compact('cartItems', 'cart'));
    }

    public function placeOrder(Request $request)
    {
        // Validate request data before proceeding
        $validated = $request->validate([
            'name' => 'required',
            'mobile' => 'required',
            'address' => 'required',
            'service_area' => 'required',
        ]);

        // Generate or retrieve guest ID
        $guestId = Cookie::get('guest_id');
        if (!$guestId) {
            return redirect()->back()->with('error', 'Failed to place order.');
        }

        $cart = CartFacade::session($guestId);
        $cartItems = $cart->getContent();

        // Ensure the cart is not empty
        if ($cartItems->isEmpty()) {
            return redirect()->back()->with('error', 'Your cart is empty.');
        }

        DB::beginTransaction();

        try {
            $delivery_change = 120;

            if ($validated['service_area'] == 'Inside Dhaka') {
                $delivery_change = 50;
            }

            $payable_amount = $cart->getTotal() + $delivery_change;

            // Create order
            $order = Order::create([
                'user_id' => Auth::id() ?? null, // Allow guest checkout
                'slug' => Str::random(5),
                'product_total_price' => $cart->getSubTotal(),
                'delivery_charge' => $delivery_change,
                'discount' => 0,

                'payable_amount' => $payable_amount,
                'paid_amount' => 0,
                'due_amount' => $payable_amount,

                'customer_name' => $validated['name'],
                'customer_mobile' => $validated['mobile'],
                'delivery_address' => $validated['address'],
                'service_area' => $validated['service_area'],
            ]);

            $orderProducts = [];

            foreach ($cartItems as $item) {

                if ($item->associatedModel->variation_id) {
                    $product = ProductVariation::find($item->associatedModel->variation_id);
                } else {
                    $product = $item->associatedModel;
                }

                $orderProducts[] = [
                    'product_id' => $item->associatedModel->id,
                    'variation_id' => $item->associatedModel->variation_id ?? null,
                    'order_id' => $order->id,

                    'product_name' => $item->associatedModel->name,
                    'product_image' => $item->associatedModel->images ? $item->associatedModel->images[0] : 'default-product-image.png',
                    'product_attributes' => $item->attributes,

                    'purchase_price' => $product->purchase_price,
                    'reguler_price' => $product->reguler_price,
                    'unit_price' => $product->selling_price,

                    'quantity' => $item->quantity,
                    'subtotal' => $product->selling_price * $item->quantity,
                    'total_price' => $product->selling_price * $item->quantity,
                ];
            }

            OrderProduct::insert($orderProducts);

            DB::commit();

            // Clear the cart after a successful order
            $cart->clear();

            return redirect()->route('order-invoice', ['order' => $order->slug])
                ->with('success', 'Order placed successfully');
        } catch (\Throwable $th) {
            DB::rollBack();
            Log::error('Order placement failed: ' . $th->getMessage(), [
                'exception' => $th,
                'request' => $request->all(),
            ]);

            return redirect()->back()->withInput()->with('error', 'Something went wrong while placing your order. Please try again. ' . $th->getMessage());
        }
    }
}
