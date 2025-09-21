<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Membership extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'membership_id', // New field for the custom membership ID
        // Personal Information
        'company_name',
        'company_type',
        'director_name',
        'nominated_director',
        'address',
        'telephone',
        'email',
        'membership_fee',
        'due_amount',
        
        // Matching Details
        'machine_count',
        'brand',
        'total_head',
        'needle_colors',
        
        // Service Fee
        'yearly_subscription',
        'receipt_no',
        'payment_date',
        'payment_year',
        'discount',
        'advance_amount',
        'opening_balance',
        'bad_debit',
        
        //newly added for bemeo start 
        'member_type',
        
        //new fees
        'subscription_fee',
        'new_fee',
        'life_member_fee',
        'donor_member_fee',
        
        'full_name',
        'father_name',
        'phone',
        'profession',
        'profession_doc_type',
        'present_address',
        'pre_thana',
        'pre_ward',
        
        'gender',
        'payment_type', // payment_type to db 
        'payment_reciever',
        'transaction_id',
        
        'guardian_type',
        'guardian_phone',
        'g_present_address_doc_type',
        
        'photo',
        'g_present_address_doc',
        'profession_doc',
        //newly added for bemeo end 


        'permanent_address',
        'permanent_district', // district to db 
        'permanent_thana', // permanent_thana to db
        'permanent_ward', //permanent_ward to db  

        
        // Affiliated Organization
        'sister_concerns',
        'remarks',

        // Document Paths
        'nomination_certificate',
        'trade_license',
        'factory_photos',
        'director_photo',

        // Status
        'is_active',
        'expense_id',
        'membership_expire_date',
        'existing_member',
    ];


    protected $casts = [
        'factory_photos' => 'array',
        'payment_date' => 'date',
        'is_active' => 'boolean',
        'membership_expire_date' => 'date',
        'membership_id' => 'string', // Cast the new field to string
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function expense()
    {
        return $this->belongsTo(Expense::class);
    }

    // Relationship to all renewal records for this membership
    public function renewals()
    {
        return $this->hasMany(RenewMembership::class, 'membership_id');
    }

    public function renewal(): RenewMembership|null
    {
        return $this->renewals()->latest()->first();
    }

    public function membershipId()
    {
        return $this->membership_id;
    }

    protected static function booted()
    {
        static::created(function (Membership $membership) {
            // If membership_id was not set during creation (e.g., by an admin),
            // auto-generate it based on the primary key.
            if (is_null($membership->membership_id)) {
                $membership->membership_id = str_pad($membership->id, 4, '0', STR_PAD_LEFT);
                $membership->saveQuietly(); // Save without triggering events again
            }
        });
    }
}
