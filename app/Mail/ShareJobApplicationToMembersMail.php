<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ShareJobApplicationToMembersMail extends Mailable
{
    use Queueable, SerializesModels;

    public string $messageText;
    public string $cvFullPath;

    public function __construct(string $messageText, string $cvFullPath)
    {
        $this->messageText = $messageText;
        $this->cvFullPath = $cvFullPath;
    }

    public function build()
    {
        if (!file_exists($this->cvFullPath)) {
            throw new \Exception("CV not found: {$this->cvFullPath}");
        }

        return $this->subject('New Job Opportunity')
            ->markdown('emails.share_job_to_members')
            ->attach($this->cvFullPath, [
                'as' => basename($this->cvFullPath),
                'mime' => 'application/pdf', // set explicitly
            ]);
    }
}
