<?php
namespace App\Http\Controllers;

use App\Enums\ExpenseCategory;
use App\Models\Expense;
use App\Models\Membership;
use App\Models\RenewMembership;
use App\Settings\AppSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RenewMembershipController extends Controller
{
    public function create()
    {
        $user       = Auth::user();
        $membership = $user->membership;

        if (! $membership) {
            return redirect()->route('dashboard')->with('error', 'No membership found to renew.');
        }

        if ($membership->membership_expire_date > Carbon::now()) {
            return redirect()->route('dashboard')->with('error', 'Membership is not expired yet.');
        }

        return view('renew-membership.create');
    }

    public function store(Request $request, AppSettings $appSettings)
    {
        $validated = $request->validate([
            'machine_count'    => 'required|integer|min:0',
            'factory_photos'   => 'nullable|array|min:3|max:5',
            'factory_photos.*' => 'nullable|file|mimes:jpg,jpeg,png,pdf',
            'director_photo'   => 'nullable|file|mimes:jpg,jpeg,png,pdf',
            'trade_license'    => 'required|file|mimes:jpg,jpeg,png,pdf',
            'payment_year'     => 'required|integer',
        ]);

        // Calculate yearly fee based on machine count
        $machines = (int) $validated['machine_count'];
        if ($machines >= 10) {
            $validated['yearly_subscription'] = $appSettings->machine_fee_10_plus;
        } elseif ($machines >= 5) {
            $validated['yearly_subscription'] = $appSettings->machine_fee_5_to_9;
        } else {
            $validated['yearly_subscription'] = $appSettings->machine_fee_1_to_4;
        }

        try {
            $user       = Auth::user();
            $membership = $user->membership;
            if (! $membership) {
                return redirect()->back()->withErrors(['error' => 'No membership found to renew.']);
            }

            // Upload director photo
            if ($request->hasFile('director_photo')) {
                $directorPhoto              = $request->file('director_photo')->store('membership/photos', 'public');
                $membership->director_photo = $directorPhoto;
            }

            // Upload factory photos (multiple)
            if ($request->hasFile('factory_photos')) {
                $factoryPhotos = [];
                foreach ($request->file('factory_photos') as $photo) {
                    $factoryPhotos[] = $photo->store('membership/factory_photos', 'public');
                }
                $membership->factory_photos = $factoryPhotos;
            }

            // trade_license
            if ($request->hasFile('trade_license')) {
                $validated['trade_license'] = $request->file('trade_license')->store('membership/documents', 'public');
            }

            // Update machine count
            $membership->machine_count       = $validated['machine_count'];
            $membership->yearly_subscription = $validated['yearly_subscription'];
            $membership->is_active           = false;
            $membership->save();

            // Create a renewal record for tracking
            $renewal                      = new RenewMembership();
            $renewal->user_id             = $user->id;
            $renewal->membership_id       = $membership->id;
            $renewal->machine_count       = $validated['machine_count'];
            $renewal->yearly_subscription = $validated['yearly_subscription'];
            $renewal->director_photo      = $membership->director_photo;

            $renewal->renew_amount      = $validated['yearly_subscription'] * $validated['payment_year'];
            $renewal->payment_year      = $validated['payment_year'];
            $renewal->renew_expire_date = date('Y-m-d', strtotime('+' . $validated['payment_year'] . ' year'));
            $renewal->is_active         = false;
            $renewal->save();

            return redirect()->back()->with('success', 'Renew membership submitted successfully!');
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->with('success', 'Error saving renew membership: ' . $e->getMessage());
        }
    }

    public function payment(Request $request, RenewMembership $renewMembership)
    {
        DB::beginTransaction();

        try {
            if (! $renewMembership->expense_id) {
                // Create new Expense if not exists
                $expense           = new Expense;
                $expense->note     = "renew membership id " . $renewMembership->membership->membership_id;
                $expense->type     = 'income';
                $expense->category = ExpenseCategory::RENEW_MEMBERSHIP;
                $expense->amount   = $renewMembership->renew_amount;
                $expense->date     = Carbon::now();
            } else {
                // Update existing Expense
                $expense = Expense::find($renewMembership->expense_id);
                if (! $expense) {
                    return back()->withErrors(['error' => 'Expense record not found.']);
                }
            }

            // Upload payment photos (multiple)
            if ($request->hasFile('payment_photos')) {
                $paymentPhotos = [];
                foreach ($request->file('payment_photos') as $photo) {
                    $paymentPhotos[] = $photo->store('renew-membership/payment_photos', 'public');
                }
                $expense->images = $paymentPhotos;
            }

            $expense->save();

            // Link expense to membership (if it was newly created)
            if (! $renewMembership->expense_id) {
                $renewMembership->expense_id = $expense->id;
            }

            $renewMembership->save();

            DB::commit();

            return back()->with('success', 'Payment information saved successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }
}
