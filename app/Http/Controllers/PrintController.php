<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PrintController extends Controller
{
    public function printEventMembers(Request $request)
    {
        // Retrieve the event ID from the session
        $eventId = session('event_id');

        // Check if the event ID is set
        if (!$eventId) {
            return redirect()->back()->with('error', 'No event selected for printing.');
        }

        // Fetch the event members based on the event ID
        $eventMembers = \App\Models\EventMember::where('event_id', $eventId)->get();

        // Return a view to display the event members for printing
        return view('print.event_members', compact('eventMembers'));
    }
}
