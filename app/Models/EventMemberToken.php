<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventMemberToken extends Model
{
    protected $fillable = [
        'name',
        'event_member_id',
        'event_id',
        'done_at',
        'is_done',
    ];

    protected $casts = [
        'done_at' => 'datetime',
        'is_done' => 'boolean',
    ];

    // Relationships
    public function event()
    {
        return $this->belongsTo(Event::class);
    }

    public function eventMember()
    {
        return $this->belongsTo(EventMember::class);
    }
}
