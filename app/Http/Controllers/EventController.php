<?php

namespace App\Http\Controllers;

use App\Enums\ExpenseCategory;
use App\Models\Event;
use App\Models\EventJoinedCompany;
use App\Models\EventMember;
use App\Models\EventMemberToken;
use App\Models\Expense;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class EventController extends Controller
{
    public function show(Event $event)
    {
        return view('events.show', ['event' => $event]);
    }

    public function join(Event $event)
    {
        $membership = Auth::user()->membership;

        if (!$membership) {
            redirect()->route('membership.create');
        }
        return view('events.join', ['event' => $event]);
    }

    public function joinStore(Request $request, Event $event)
    {
        DB::beginTransaction();
        // dd($request->all());

        try {
            $appSettings = app(\App\Settings\AppSettings::class);
            $totalAmount = 0;

            if ($request->is_free == 1) {
                $totalAmount = 0;
            } else {
                foreach ($request->names as $key => $name) {
                    $age = $request->ages[$key];

                    $amount = $age < 10 ? $appSettings->age_1_to_9 : $appSettings->age_10_up;
                    $totalAmount += $amount;
                }
            }

            $eventJoinedCompany = EventJoinedCompany::create([
                'event_id' => $event->id,
                'user_id' => Auth::id(),
                'amount' => $totalAmount,
                'paid' => false,
            ]);

            foreach ($request->names as $key => $name) {
                $age = $request->ages[$key];
                $relation = $request->relations[$key];
                $photo = $request->file('photo')[$key] ?? null;

                $imagePath = null;
                if ($photo && $photo->isValid()) {
                    $imagePath = $photo->store('event_member_photos', 'public');
                }
                if ($request->is_free == 1) {
                    $amount = 0;
                    $totalAmount = 0;
                } else {
                    $amount = $age < 10 ? $appSettings->age_1_to_9 : $appSettings->age_10_up;
                    $totalAmount += $amount;
                }
                EventMember::create([
                    'event_id' => $event->id,
                    'user_id' => Auth::id(),
                    'name' => $name,
                    'age' => $age,
                    'relation' => $relation,
                    'image' => $imagePath,
                    'amount' => $amount,
                    'approved' => false, // Default: not approved
                    'event_joined_company_id' => $eventJoinedCompany->id,
                ]);
            }


            DB::commit();

            return response()->json(['message' => 'Successfully joined the event.']);
        } catch (\Exception $e) {
            DB::rollBack();

            // Optional: log the error for debugging
            Log::error('Event join failed', [
                'error' => $e->getMessage(),
                'user_id' => Auth::id(),
            ]);

            return response()->json([
                'message' => 'Failed to join the event.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function pdfPrint(Event $event)
    {
        $pdf = Pdf::loadView('pdf.event-members', compact('event'));

        // return $pdf->download("{$event->name}-members.pdf");
        return $pdf->stream("{$event->name}-members.pdf");
    }

    public function badgePdfPrint(Event $event)
    {
        $pdf = Pdf::loadView('pdf.event-members-badge', compact('event'))
            ->setPaper('a4',)
            // ->setPaper('a4', 'landscape' )
            ->setOption(['dpi' => 180, 'defaultFont' => 'sans-serif'])
            ->setWarnings(false);

        // return $pdf->download("{$event->name}-members.pdf");
        return $pdf->stream("{$event->name}-badge.pdf");
    }

    public function pay(Request $request, EventJoinedCompany $event)
    {
        return view('events.pay', ['eventJoinedCompany' => $event]);
    }

    public function payStore(Request $request, EventJoinedCompany $event)
    {
        DB::beginTransaction();

        try {
            $membershipCompaney = $event;
            if (!$event->expense_id) {
                $membership = auth()->user()->membership;
                // Create new Expense if not exists
                $expense = new Expense;
                $expense->note = "Event payment ({$membershipCompaney?->event?->title}). membership id " . $membership->membership_id;
                $expense->type = 'income';
                $expense->category = ExpenseCategory::EVENT;

                $expense->amount = $membershipCompaney->amount;

                $expense->date = Carbon::now();
            } else {
                // Update existing Expense
                $expense = Expense::find($membershipCompaney->expense_id);
                if (!$expense) {
                    return back()->withErrors(['error' => 'Expense record not found.']);
                }
            }

            // Upload payment photos (multiple)
            if ($request->hasFile('payment_photos')) {
                $paymentPhotos = [];
                foreach ($request->file('payment_photos') as $photo) {
                    $paymentPhotos[] = $photo->store('event/payment_photos', 'public');
                }
                $expense->images = $paymentPhotos;
            }

            $expense->save();

            // Link expense to membership (if it was newly created)
            if (!$membershipCompaney->expense_id) {
                $membershipCompaney->expense_id = $expense->id;
            }

            $membershipCompaney->save();

            DB::commit();

            return back()->with('success', 'Payment information saved successfully.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'An error occurred: ' . $e->getMessage()]);
        }
    }

    public function DowenloadToken(Event $event)
    {
        $eventMembers = EventMember::where('user_id', Auth::id())
            ->where('event_id', $event->id)
            ->get('id');

        // Event ডাটা রিট্রিভ করুন
        $token = EventMemberToken::where('event_id', $event->id)
            ->whereIn('event_member_id', $eventMembers->pluck('id')->toArray())
            ->get('id');

        // যেকোনো টোকেন নাম লাগলে নিচে ব্যবহার করতে পারেন: $data['token_name']

        $ids = $token->pluck('id')->toArray();
        session(['print_token_ids' => $ids]);

        return redirect()->route('print.tokens');
    }
}
