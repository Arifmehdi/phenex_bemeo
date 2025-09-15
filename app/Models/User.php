<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements FilamentUser
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'email_verified_at',
        'mobile_number',
        'mobile_number_verified_at',
        'address',
        'password',
        'type',
        'can_login',
        'profile_picture',
        'is_admin',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'mobile_number_verified_at' => 'datetime',
            'can_login' => 'boolean',
            'is_admin' => 'boolean',
        ];
    }

    public function membership()
    {
        return $this->hasOne(Membership::class);
    }

    public function certificateRequest()
    {
        return $this->hasOne(CertificateRequest::class);
    }

    public function sponsor()
    {
        return $this->hasOne(Sponsor::class)->latest();
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->is_admin && $this->can_login;
    }
}
