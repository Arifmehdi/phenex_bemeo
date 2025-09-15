<?php

namespace App\Panel\Admin\Resources\MembershipResource\Pages;

use App\Panel\Admin\Resources\MembershipResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateMembership extends CreateRecord
{
    protected static string $resource = MembershipResource::class;
}
