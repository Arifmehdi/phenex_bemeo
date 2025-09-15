<?php

namespace App\Http\Controllers;

use App\Models\EventMember;
use Illuminate\Http\Request;

class EventMemberController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'event_id' => 'required|exists:events,id',
            'user_id' => 'required|exists:users,id',
            'relation' => 'required|string|max:255',
        ]);

        $eventMember = EventMember::create($validated);

        return response()->json([
            'message' => 'Member successfully joined the event!',
            'data' => $eventMember,
        ], 201);
    }
}
