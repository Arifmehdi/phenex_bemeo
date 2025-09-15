<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'category',
        'type',
        'amount',
        'note',
        'is_verified',
        'expense_id',
        'images',
        'expense_category_id',
    ];

    protected $casts = [
        'date'   => 'date',
        'amount' => 'decimal:2',
        'images' => 'array',
    ];

    public function category()
    {
        return $this->belongsTo(ExpenseCategory::class, 'expense_category_id');
    }
}
