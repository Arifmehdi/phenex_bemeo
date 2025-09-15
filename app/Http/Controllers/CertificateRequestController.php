<?php

namespace App\Http\Controllers;

use \Storage;
use App\Enums\ExpenseCategory;
use App\Models\CertificateRequest;
use App\Models\Expense;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CertificateRequestController extends Controller
{
    public function create()
    {


        return view('request-certificate.create');
    }

    public function store(Request $request)
    {
        // Validate the request data
        $validated = $request->validate([
            'company_name'       => 'required|string|max:255',
            'company_type'       => 'required|in:Limited Company,Proprietorship,Foreign Joint Venture',
            'director_name'      => 'required|string|max:255',
            'nominated_director' => 'nullable|string|max:255',
            'address'            => 'required|string|max:500',
            'phone'              => 'required|string|max:20',
            'email'              => 'required|email|max:255',
            // 'certificate_fee' => 'required|numeric',
            'receipt_no'         => 'nullable|string|max:255',
            'date'               => 'required|date',
            'year'               => 'nullable|integer',
            'verification_image' => 'required|file|mimes:jpg,jpeg,png,pdf',
        ]);

        // Handle file upload
        if ($request->hasFile('verification_image')) {
            $filePath = $request->file('verification_image')->store('certificate_docs', 'public');
        } else {
            return back()->with('error', 'Verification document is required');
        }

        // Create the certificate request
        $certificateRequest = CertificateRequest::create([
            'user_id'                 => Auth::id(),
            'company_name'            => $request->company_name,
            'company_type'            => $request->company_type,
            'director_name'           => $request->director_name,
            'nominated_director'      => $request->nominated_director,
            'address'                 => $request->address,
            'phone'                   => $request->phone,
            'email'                   => $request->email,
            'certificate_fee'         => 2000,
            'receipt_no'              => 000,
            'date'                    => $request->date,
            'year'                    => $request->year ?? Carbon::now()->year,
            'verification_image_path' => $filePath,
            'status'                  => 'pending', // default status
        ]);

        return redirect()->back()->with('success', 'Certificate request submitted successfully!');
    }

    public function payment(Request $request, CertificateRequest $certificateRequest)
    {
        DB::beginTransaction();

        try {
            if (! $certificateRequest->expense_id) {
                // Create new Expense if not exists
                $expense           = new Expense;
                $expense->note     = "Certificate request id " . $certificateRequest->id;
                $expense->type     = 'income';
                $expense->category = ExpenseCategory::CERTIFICATE;
                $expense->amount   = $certificateRequest->certificate_fee;
                $expense->date     = Carbon::now();
            } else {
                // Update existing Expense
                $expense = Expense::find($certificateRequest->expense_id);
                if (! $expense) {
                    return back()->withErrors(['error' => 'Expense record not found.']);
                }
            }

            // Upload payment photos (multiple)
            if ($request->hasFile('payment_photos')) {
                $paymentPhotos = [];
                foreach ($request->file('payment_photos') as $photo) {
                    $paymentPhotos[] = $photo->store('certificate_payment', 'public');
                }
                $expense->images = $paymentPhotos;
            }

            $expense->save();

            // Link expense to membership (if it was newly created)
            if (! $certificateRequest->expense_id) {
                $certificateRequest->expense_id = $expense->id;
            }

            $certificateRequest->save();

            DB::commit();

            return back()->with('success', 'Payment information saved successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }
    public function qrcode($id)
    {
        $member = CertificateRequest::findOrFail($id);

        $path = $member->qr_code_path; // Example: 'qrcodes/membership_11.png'

        if (Storage::disk('public')->exists($path)) {
            $fileName = 'qrcode_' . $member->id . '.' . pathinfo($path, PATHINFO_EXTENSION);
            return Storage::disk('public')->download($path, $fileName);
        }

        abort(404, 'QR code not found.');
    }
}
