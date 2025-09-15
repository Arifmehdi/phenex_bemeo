<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CertificateRequest extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'company_name',
        'company_type',
        'director_name',
        'nominated_director',
        'address',
        'phone',
        'email',
        'certificate_fee',
        'receipt_no',
        'date',
        'year',
        'verification_image_path',
        'status',
        'certificate_collect_date',
        'expence_id',
        'qr_code_path',
    ];

    protected function casts(): array
    {
        return [
            'certificate_collect_date' => 'datetime',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function expense()
    {
        return $this->belongsTo(Expense::class);
    }
}
