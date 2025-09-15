<?php

namespace App\Mail;

use App\Models\EventMember;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EventMemberNotificationMail extends Mailable
{
    use Queueable, SerializesModels;

    public $eventMember;

    public function __construct(EventMember $eventMember)
    {
        $this->eventMember = $eventMember;
    }

    public function build()
    {
        return $this->subject('Your Event Registration Confirmation')
            ->markdown('emails.event_member_notification');
    }
}
