<?php

namespace App\Panel\Admin\Resources\MembershipRequestResource\Pages;

use App\Panel\Admin\Resources\MembershipRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateMembershipRequest extends CreateRecord
{
    protected static string $resource = MembershipRequestResource::class;
}
