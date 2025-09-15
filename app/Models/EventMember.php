<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventMember extends Model
{
    use HasFactory;

    protected $fillable = [
        'event_id',
        'user_id',
        'name',
        'age',
        'image',
        'relation',
        'amount',
        'paid',
        'approved',
        'event_joined_company_id'
    ];

    // এই মেম্বার কোন ইভেন্টে যুক্ত
    public function event()
    {
        return $this->belongsTo(Event::class);
    }

    // মেম্বার ইউজার (user_id)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function eventMemberTokens()
    {
        return $this->hasMany(EventMemberToken::class);
    }
}
