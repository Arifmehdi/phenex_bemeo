<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'title',
        'description',
        'join_deadline',
        'image',
        'is_free',
    ];

    protected function casts()
    {
        return [
            'join_deadline' => 'date',
        ];
    }

    // Event created by a user
    public function creator()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // All members under this event
    public function members()
    {
        return $this->hasMany(EventMember::class);
    }

    public function eventMembers()
    {
        return $this->hasMany(EventMember::class);
    }

    public function EventJoinedCompanies()
    {
        return $this->hasMany(EventJoinedCompany::class);
    }

    public function EventCompanies()
    {
        return $this->hasManyThrough(
            Membership::class,
            EventMember::class,
            'event_id',
            'user_id',
            'id',
            'user_id'
        )->distinct('memberships.id');
    }
}
