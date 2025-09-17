<?php

namespace App\Http\Controllers;

use App\Enums\ExpenceCategory;
use App\Enums\ExpenseCategory;
use App\Models\Expense;
use App\Models\Membership;
use App\Settings\AppSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MembershipController extends Controller
{

    public function create()
    {
        return view('memberships.create');
    }

    public function mcreate()
    {
        return view('memberships.mcreate');
    }

    // public function store(Request $request, AppSettings $appSettings)
    // {
    //     $validated = $request->validate([
    //         'company_name' => 'nullable|string|max:255',
    //         'company_type' => 'nullable|in:Limited Company,Proprietorship,Foreign Joint Venture,Partnership',
    //         'director_name' => 'nullable|string|max:255',
    //         'nominated_director' => 'nullable|string|max:255',
    //         'address' => 'nullable|string|max:500',
    //         'telephone' => 'nullable|string|max:20',
    //         'phone' => 'nullable|string|max:20',
    //         'email' => 'nullable|email|max:255',
    //         'gender' => 'nullable|in:Male,Female',
    //         'machine_count' => 'nullable|integer|min:0',
    //         'brand' => 'nullable|string|max:255',
    //         'total_head' => 'nullable|string|max:255',
    //         'needle_colors' => 'nullable|string|max:255',
    //         'payment_date' => 'nullable|date',
    //         'payment_year' => 'nullable|integer',
    //         'sister_concerns' => 'nullable|string',
    //         'remarks' => 'nullable|string',
    //         'nomination_certificate' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
    //         'trade_license' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
    //         'factory_photos' => 'nullable|array|min:3|max:5',
    //         'factory_photos.*' => 'image|mimes:jpg,jpeg,png|max:2048',
    //         'director_photo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
    //     ]);

    //     // Define a mapping of company types to membership fees
    //     $membershipFees = [
    //         'Limited Company' => $appSettings->limited_company_fee,
    //         'Proprietorship' => $appSettings->proprietorship_fee,
    //         'Foreign Joint Venture' => $appSettings->foreign_joint_venture_fee,
    //         'Partnership' => $appSettings->partnership,
    //     ];

    //     // Calculate membership_fee
    //     $validated['membership_fee'] = $membershipFees[$validated['company_type']] ?? null;

    //     // Calculate yearly fee based on machine count
    //     $machines = (int) $validated['machine_count'];
    //     if ($machines >= 10) {
    //         $validated['yearly_subscription'] = $appSettings->machine_fee_10_plus;
    //     } elseif ($machines >= 5) {
    //         $validated['yearly_subscription'] = $appSettings->machine_fee_5_to_9;
    //     } else {
    //         $validated['yearly_subscription'] = $appSettings->machine_fee_1_to_4;
    //     }

    //     // Handle file uploads
    //     try {
    //         $validated['user_id'] = Auth::user()->id;
    //         $validated['is_active'] = false;

    //         // Upload nomination certificate
    //         if ($request->hasFile('nomination_certificate')) {
    //             $validated['nomination_certificate'] = $request->file('nomination_certificate')
    //                 ->store('membership/documents', 'public');
    //         }

    //         // Upload trade license
    //         if ($request->hasFile('trade_license')) {
    //             $validated['trade_license'] = $request->file('trade_license')
    //                 ->store('membership/documents', 'public');
    //         }

    //         // Upload director photo
    //         if ($request->hasFile('director_photo')) {
    //             $validated['director_photo'] = $request->file('director_photo')
    //                 ->store('membership/photos', 'public');
    //         }

    //         // Upload factory photos (multiple)
    //         if ($request->hasFile('factory_photos')) {
    //             $factoryPhotos = [];
    //             foreach ($request->file('factory_photos') as $photo) {
    //                 $factoryPhotos[] = $photo->store('membership/factory_photos', 'public');
    //             }
    //             $validated['factory_photos'] = $factoryPhotos;
    //         }

    //         // Create membership
    //         Membership::create($validated);

    //         return redirect()->back()->with('success', 'Membership submitted successfully!');
    //     } catch (\Exception $e) {
    //         return redirect()->back()
    //             ->withInput()
    //             ->with('error', 'Error saving membership: ' . $e->getMessage());
    //     }
    // }


public function store(Request $request, AppSettings $appSettings)
{
    $validated = $request->validate([
        'member_type' => 'nullable|numeric',
        'subscription_fee' => 'nullable|integer|min:0',
        'new_fee' => 'nullable|integer|min:0',
        'life_member_fee' => 'nullable|integer|min:0',
        'donor_member_fee' => 'nullable|integer|min:0',
        'full_name' => 'nullable|string|max:255',
        'father_name' => 'nullable|string|max:255',
        'phone' => 'nullable|string|max:20',
        'profession' => 'nullable|string|max:255',
        'profession_doc_type' => 'nullable|string|max:255',
        'present_address' => 'nullable|string|max:255',
        'permanent_address' => 'nullable|string|max:255',
        'union_name' => 'nullable|string|max:255',
        'ward' => 'nullable|string|max:255',
        'guardian_type' => 'nullable|numeric',
        'guardian_phone' => 'nullable|string|max:20',
        'present_address_doc_type' => 'nullable|string|max:255',
        'gender' => 'nullable|in:Male,Female',

        // File validations
        'profession_doc' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        'present_address_doc' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        'photo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
    ]);


    try {
        $validated['user_id'] = Auth::id();
        $validated['is_active'] = false;

        // if ($request->hasFile('profession_doc') && $request->file('profession_doc')->isValid()) {
        //     $file = $request->file('profession_doc');
        //     $filename = uniqid().'_'.$file->getClientOriginalName();
        //     $validated['profession_doc'] = $file->storeAs('membership/documents', $filename, 'public');
        // }

        // if ($request->hasFile('present_address_doc') && $request->file('present_address_doc')->isValid()) {
        //     $file = $request->file('present_address_doc');
        //     $filename = uniqid().'_'.$file->getClientOriginalName();
        //     $validated['present_address_doc'] = $file->storeAs('membership/documents', $filename, 'public');
        // }

        // if ($request->hasFile('photo') && $request->file('photo')->isValid()) {
        //     $file = $request->file('photo');
        //     $filename = uniqid().'_'.$file->getClientOriginalName();
        //     $validated['photo'] = $file->storeAs('membership/photos', $filename, 'public');
        // }
        Membership::create($validated);

        return redirect()->back()->with('success', 'Membership submitted successfully!');
    } catch (\Exception $e) {
        return redirect()->back()
            ->withInput()
            ->with('error', 'Error saving membership: ' . $e->getMessage());
    }
}



    // public function store(Request $request, AppSettings $appSettings)
    // {


    //     $validated = $request->validate([
    //         'member_type' => 'nullable|numeric',
    //         'subscription_fee' => 'nullable|integer|min:0',
    //         'new_fee' => 'nullable|integer|min:0',
    //         'life_member_fee' => 'nullable|integer|min:0',
    //         'donor_member_fee' => 'nullable|integer|min:0',
    //         'full_name' => 'nullable||string|max:255',
    //         'father_name' => 'nullable|string|max:255',
    //         'phone' => 'nullable|string|max:20',
    //         'profession' => 'nullable|string|max:255',
    //         'profession_doc_type' => 'nullable|string|max:255',
    //         'present_address' => 'nullable|string|max:255',
    //         'permanent_address' => 'nullable|string|max:255',
    //         'union_name' => 'nullable|string|max:255',
    //         'ward' => 'nullable|string|max:255',
    //         'guardian_type' => 'nullable|numeric',
    //         'guardian_phone' => 'nullable|string|max:20',
    //         'present_address_doc_type' => 'nullable|string|max:255',
    //         'gender' => 'nullable|in:Male,Female',
    //         // 'profession_doc' => 'nullable|array|min:3|max:5',
    //         // 'profession_doc.*' => 'image|mimes:jpg,jpeg,png|max:2048',
    //         'profession_doc' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
    //         'present_address_doc' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
    //         'photo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
    //     ]);

    //     // dd($request->all());

    //     // // Define a mapping of company types to membership fees
    //     // $membershipFees = [
    //     //     'Limited Company' => $appSettings->limited_company_fee,
    //     //     'Proprietorship' => $appSettings->proprietorship_fee,
    //     //     'Foreign Joint Venture' => $appSettings->foreign_joint_venture_fee,
    //     //     'Partnership' => $appSettings->partnership,
    //     // ];

    //     // Calculate membership_fee
    //     // $validated['membership_fee'] = $membershipFees[$validated['company_type']] ?? null;

    //     // Calculate yearly fee based on machine count
    //     // $machines = (int) $validated['machine_count'];
    //     // if ($machines >= 10) {
    //     //     $validated['yearly_subscription'] = $appSettings->machine_fee_10_plus;
    //     // } elseif ($machines >= 5) {
    //     //     $validated['yearly_subscription'] = $appSettings->machine_fee_5_to_9;
    //     // } else {
    //     //     $validated['yearly_subscription'] = $appSettings->machine_fee_1_to_4;
    //     // }

    //     // Handle file uploads
    //     try {
    //         $validated['user_id'] = Auth::user()->id;
    //         $validated['is_active'] = false;

    //         // Upload nomination certificate
    //         if ($request->hasFile('profession_doc')) {
    //             $validated['profession_doc'] = $request->file('profession_doc')
    //                 ->store('membership/documents', 'public');
    //         }

    //         // Upload trade license
    //         if ($request->hasFile('present_address_doc')) {
    //             $validated['present_address_doc'] = $request->file('present_address_doc')
    //                 ->store('membership/documents', 'public');
    //         }

    //         // Upload director photo
    //         if ($request->hasFile('photo')) {
    //             $validated['photo'] = $request->file('photo')
    //                 ->store('membership/photos', 'public');
    //         }

    //         // // Upload factory photos (multiple)
    //         // if ($request->hasFile('factory_photos')) {
    //         //     $factoryPhotos = [];
    //         //     foreach ($request->file('factory_photos') as $photo) {
    //         //         $factoryPhotos[] = $photo->store('membership/factory_photos', 'public');
    //         //     }
    //         //     $validated['factory_photos'] = $factoryPhotos;
    //         // }

    //         // Create membership
    //         Membership::create($validated);

    //         return redirect()->back()->with('success', 'Membership submitted successfully!');
    //     } catch (\Exception $e) {
    //         return redirect()->back()
    //             ->withInput()
    //             ->with('error', 'Error saving membership: ' . $e->getMessage());
    //     }
    // }


    public function downloadPhoto($id)
    {
        $member = Membership::findOrFail($id);

        $path = $member->director_photo; // This is 'membership/photos/abc.jpg'

        if (\Storage::disk('public')->exists($path)) {
            // Optional: set a custom download name
            $fileName = 'director_photo_' . $member->id . '.' . pathinfo($path, PATHINFO_EXTENSION);

            return \Storage::disk('public')->download($path, $fileName);
        } else {
            abort(404, 'Photo not found.');
        }
    }


    public function destroy()
    {
        $membership = Auth::user()->membership;

        if ($membership) {
            $membership->delete();
            return redirect()->back()->with('success', 'Membership request cancelled successfully.');
        }

        return redirect()->back()->with('error', 'No membership found to cancel.');
    }

    public function payment(Request $request, Membership $membership)
    {
        DB::beginTransaction();

        try {
            if (!$membership->expense_id) {
                // Create new Expense if not exists
                $expense = new Expense;
                $expense->note = "membership id " . $membership->membership_id;
                $expense->type = 'income';
                $expense->category = ExpenseCategory::MEMBERSHIP;

                if ($membership->existing_member) {
                    $expense->amount = $membership->due_amount;
                } else {
                    $expense->amount = $membership->membership_fee + $membership->yearly_subscription * 2;
                }

                $expense->date = Carbon::now();
            } else {
                // Update existing Expense
                $expense = Expense::find($membership->expense_id);
                if (!$expense) {
                    return back()->withErrors(['error' => 'Expense record not found.']);
                }
            }

            // Upload payment photos (multiple)
            if ($request->hasFile('payment_photos')) {
                $paymentPhotos = [];
                foreach ($request->file('payment_photos') as $photo) {
                    $paymentPhotos[] = $photo->store('membership/payment_photos', 'public');
                }
                $expense->images = $paymentPhotos;
            }

            $expense->save();

            // Link expense to membership (if it was newly created)
            if (!$membership->expense_id) {
                $membership->expense_id = $expense->id;
            }

            $membership->save();

            DB::commit();

            return back()->with('success', 'Payment information saved successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }

    // public function print(Request $request)
    // {
    //     // Apply filters if needed
    //     $query = \App\Models\Membership::query();

    //     if ($request->has('tableFilters')) {
    //         // Optionally apply filters from Filament
    //     }

    //     $memberships = $query->orderBy('created_at', 'desc')->get();

    //     return view('memberships.print', compact('memberships'));
    // }

    public function print(Request $request)
    {
        $query = \App\Models\Membership::query();

        // Get filters from request
        $filters = $request->get('filters', []);

        // Apply company_type filter if present
        if (!empty($filters['company_type']['value'])) {
            $query->where('company_type', $filters['company_type']['value']);
        }

        // Apply Active Status filter if present
        if (isset($filters['is_active']['value']) && $filters['is_active']['value'] !== null) {
            $query->where('is_active', (bool) $filters['is_active']['value']);
        }

        // Apply Due Amount filter
        if (!empty($filters['due_amount']['from'])) {
            $query->where('due_amount', '>=', $filters['due_amount']['from']);
        }
        if (!empty($filters['due_amount']['until'])) {
            $query->where('due_amount', '<=', $filters['due_amount']['until']);
        }

        // Apply Membership Expire Date filter
        if (!empty($filters['membership_expire_date']['from'])) {
            $query->whereDate('membership_expire_date', '>=', $filters['membership_expire_date']['from']);
        }
        if (!empty($filters['membership_expire_date']['until'])) {
            $query->whereDate('membership_expire_date', '<=', $filters['membership_expire_date']['until']);
        }

        // Apply Created At filter
        if (!empty($filters['created_at']['created_from'])) {
            $query->whereDate('created_at', '>=', $filters['created_at']['created_from']);
        }
        if (!empty($filters['created_at']['created_until'])) {
            $query->whereDate('created_at', '<=', $filters['created_at']['created_until']);
        }

        $memberships = $query->orderBy('created_at', 'desc')->get();

        return view('memberships.print', compact('memberships'));
    }
}
