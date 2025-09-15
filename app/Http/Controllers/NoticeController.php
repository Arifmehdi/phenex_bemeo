<?php

namespace App\Http\Controllers;

use App\Models\Notice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class NoticeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $query = Notice::query();

        // Check if a user is logged in
        if (Auth::check()) {
            // If logged in, show only their notices
            $query->where('user_id', Auth::id());
        } else {
            // If not logged in, show only active public notices (optional, adjust as needed)
            // For now, let's assume non-logged in users cannot see any notices on this specific page
            // or you might want to show all active notices.
            // If you want to show all active notices for guests:
            // $query->where('is_active', true)
            //       ->where(function ($q) {
            //           $q->whereNull('start_date')->orWhere('start_date', '<=', now());
            //       })
            //       ->where(function ($q) {
            //           $q->whereNull('end_date')->orWhere('end_date', '>=', now());
            //       });
            return redirect()->route('login')->with('error', 'You need to login to view your notices.');
        }
        $notices = $query->latest()->get();
        return view('notices.index', compact('notices'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // This might be handled by Filament Admin Panel, but including for completeness
        return view('notices.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048', // Max 2MB
            'is_active' => 'boolean',
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Please fix the errors and try again.');
        }

        $validatedData = $validator->validated();

        try {
            // Handle file upload
            if ($request->hasFile('image')) {
                $validatedData['image'] = $request->file('image')->store('notices', 'public');
            }

            // Set the user_id of the authenticated user
            $validatedData['user_id'] = Auth::id();

            Notice::create($validatedData);

            // Redirect to a relevant page, maybe the list of notices or dashboard
            // If using Filament, this store method might not be directly used for admin creation.
            // This is more for a frontend form if you have one.
            return redirect()->back()->with('success', 'Notice created successfully!');
        } catch (\Exception $e) {
            Log::error('Notice creation error: ' . $e->getMessage());
            return back()->withInput()->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Notice $notice)
    {
        return view('notices.show', compact('notice'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Notice $notice)
    {
        // This might be handled by Filament Admin Panel
        return view('notices.edit', compact('notice'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Notice $notice)
    {
        // This might be handled by Filament Admin Panel
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048', // Max 2MB
            'is_active' => 'boolean',
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Please fix the errors and try again.');
        }

        $validatedData = $validator->validated();

        try {
            // Handle file upload
            if ($request->hasFile('image')) {
                // Optional: Delete old image if it exists
                // Storage::disk('public')->delete($notice->image);
                $validatedData['image'] = $request->file('image')->store('notices', 'public');
            }

            $notice->update($validatedData);

            return redirect()->back()->with('success', 'Notice updated successfully!');
        } catch (\Exception $e) {
            Log::error('Notice update error: ' . $e->getMessage());
            return back()->withInput()->with('error', 'Something went wrong. Please try again.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Notice $notice)
    {
        // This might be handled by Filament Admin Panel
        try {
            // Optional: Delete associated image
            // Storage::disk('public')->delete($notice->image);

            $notice->delete();

            return redirect()->back()->with('success', 'Notice deleted successfully!');
        } catch (\Exception $e) {
            Log::error('Notice deletion error: ' . $e->getMessage());
            return back()->with('error', 'Something went wrong. Please try again.');
        }
    }
}
