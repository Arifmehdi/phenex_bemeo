<?php
namespace App\Http\Controllers;

use App\Models\JobApplication;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class JobApplicationController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'             => 'required|string|max:255',
            'email'            => 'required|email|max:255',
            'phone'            => 'required|string|max:20',
            'desired_position' => 'required|string|max:255',
            'cv'               => 'required|file|mimes:pdf,doc,docx',
            'photo'            => 'required|image|mimes:jpg,jpeg,png|max:200', // max 200kb
            'message'          => 'nullable|string',
            'location'         => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput()->with('error', 'Please fix the errors and try again.');
        }

        try {
            $cvPath    = $request->file('cv')->store('job_applications/cvs', 'public');
            $photoPath = $request->hasFile('photo')
            ? $request->file('photo')->store('job_applications/photos', 'public')
            : null;

            JobApplication::create([
                'name'             => $request->name,
                'email'            => $request->email,
                'phone'            => $request->phone,
                'desired_position' => $request->desired_position,
                'cv_path'          => $cvPath,
                'photo_path'       => $photoPath,
                'message'          => $request->message,
                'location'         => $request->location,
            ]);

            return back()->with('success', 'Your application has been submitted successfully!');
        } catch (\Exception $e) {
            Log::error('Job application error: ' . $e->getMessage());
            return back()->withInput()->with('error', 'Something went wrong. Please try again.');
        }
    }
}
