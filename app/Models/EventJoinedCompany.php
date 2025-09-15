<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class EventJoinedCompany extends Model
{
    protected $fillable = [
        'event_id',
        'user_id',
        'amount',
        'paid',
        'expense_id',
    ];

    public function membership()
    {
        return $this->hasOne(Membership::class);
    }

    public function event()
    {
        return $this->belongsTo(Event::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function expense()
    {
        return $this->belongsTo(Expense::class);
    }

    public function eventMembers()
    {
        return $this->hasMany(EventMember::class, 'event_joined_company_id');
    }
}
