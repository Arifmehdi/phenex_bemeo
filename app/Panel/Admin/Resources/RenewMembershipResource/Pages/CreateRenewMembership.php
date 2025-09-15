<?php

namespace App\Panel\Admin\Resources\RenewMembershipResource\Pages;

use App\Panel\Admin\Resources\RenewMembershipResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateRenewMembership extends CreateRecord
{
    protected static string $resource = RenewMembershipResource::class;
}