<?php

namespace App\Http\Controllers;

use App\Models\Donation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class DonationController extends Controller
{
    public function create()
    {
        // You'll need to create this Blade view: resources/views/donations/create.blade.php
        return view('donations.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|min:1',
            'donor_name' => 'nullable|string|max:255',
            'donor_email' => 'nullable|email|max:255',
            'message' => 'nullable|string|max:1000',
            'is_anonymous' => 'nullable|boolean',
            'payment_method' => 'required|string', // Example: 'manual_bank_transfer', 'bkash'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Please fix the errors and try again.');
        }

        $validatedData = $validator->validated();

        try {
            $donation = Donation::create([
                'user_id' => Auth::check() ? Auth::id() : null,
                'donor_name' => ($validatedData['is_anonymous'] ?? false) ? 'Anonymous' : $validatedData['donor_name'],
                'donor_email' => ($validatedData['is_anonymous'] ?? false) ? null : $validatedData['donor_email'],
                'amount' => $validatedData['amount'],
                'currency' => 'BDT', // Or make this configurable
                'message' => $validatedData['message'],
                'status' => 'pending', // Initially pending
                'payment_method' => $validatedData['payment_method'],
                'is_anonymous' => $validatedData['is_anonymous'] ?? false,
            ]);

            return redirect()->route('donations.thankyou', ['donation_id' => $donation->id])
                             ->with('success', 'Thank you for your donation intention! Please follow the instructions to complete your payment.');

        } catch (\Exception $e) {
            Log::error('Donation submission error: ' . $e->getMessage());
            return back()->withInput()->with('error', 'Something went wrong. Please try again.');
        }
    }

    public function thankYou(Request $request)
    {
        $donationId = $request->query('donation_id');
        $donation = Donation::find($donationId);
        // You'll need to create this Blade view: resources/views/donations/thank_you.blade.php
        return view('donations.thank_you', compact('donation'));
    }
}