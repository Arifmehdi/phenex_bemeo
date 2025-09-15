<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sponsor extends Model
{
    use HasFactory;

    protected $fillable = [
        'expense_id',
        'expense_category_id',
        'user_id',
        'reason',
        'company_logo',
        'company_name',
        'amount',
        'company_address',
        'is_active'
    ];

    // Relationship with Expense
    public function expense()
    {
        return $this->belongsTo(Expense::class);
    }
    
    // Relationship with Expense
    public function expense_category()
    {
        return $this->belongsTo(ExpenseCategory::class,'expense_category_id');
    }

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
