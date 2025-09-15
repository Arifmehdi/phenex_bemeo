<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RenewMembership extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'membership_id',

        // Matching Details
        'machine_count',

        // Service Fee
        'yearly_subscription',
        'due_amount',
        'renew_amount', // The actual amount for this specific renewal transaction (usually same as yearly_subscription)
        'payment_year',

        // Document Paths
        'director_photo',

        // Status
        'is_active',
        'expense_id',
        'renew_expire_date',
    ];

    protected $casts = [
        'is_active'         => 'boolean',
        'renew_expire_date' => 'date',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function expense()
    {
        return $this->belongsTo(Expense::class);
    }

    // Relationship to the original Membership being renewed
    public function originalMembership()
    {
        return $this->belongsTo(Membership::class, 'membership_id');
    }
}
