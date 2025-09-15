<?php

namespace App\Http\Controllers;

use App\Enums\ExpenseCategory;
use App\Models\Expense;
use App\Models\Sponsor;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SponsorController extends Controller
{

    public function create()
    {
        return view('sponsors.create');
    }

   
    public function store(Request $request)
    {
        $validated = $request->validate([
            'reason' => 'nullable|string',
            'company_logo'      => 'nullable|image|max:4096',
            'company_name'      => 'required|string|max:255',
            'company_address'   => 'nullable|string',
            'amount'            => 'nullable',
        ]);

        if ($request->hasFile('company_logo')) {
            $validated['company_logo'] = $request->file('company_logo')->store('sponsors', 'public');
        }

        $validated['user_id'] = Auth::user()->id;

        Sponsor::create($validated);

        return redirect()->back()->with('success', 'Sponsor created successfully.');
    }
    
    public function payment(Request $request, Sponsor $sponsor)
    {
        DB::beginTransaction();

        try {
            if (!$sponsor->expense_id) {
                // Create new Expense if not exists
                $expense = new Expense;
                $expense->note = "membership id " . $sponsor->id;
                $expense->type = 'income';
                $expense->category = ExpenseCategory::SPONSOR;
                $expense->amount = 500;
                $expense->date = Carbon::now();
            } else {
                // Update existing Expense
                $expense = Expense::find($sponsor->expense_id);
                if (!$expense) {
                    return back()->withErrors(['error' => 'Expense record not found.']);
                }
            }

            // Upload payment photos (multiple)
            if ($request->hasFile('payment_photos')) {
                $paymentPhotos = [];
                foreach ($request->file('payment_photos') as $photo) {
                    $paymentPhotos[] = $photo->store('sponsor_payment', 'public');
                }
                $expense->images = $paymentPhotos;
            }

            $expense->save();

            // Link expense to membership (if it was newly created)
            if (!$sponsor->expense_id) {
                $sponsor->expense_id = $expense->id;
            }

            $sponsor->save();

            DB::commit();

            return back()->with('success', 'Payment information saved successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }
}
