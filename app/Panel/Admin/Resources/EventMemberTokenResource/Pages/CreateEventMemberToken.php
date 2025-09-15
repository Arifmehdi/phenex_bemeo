<?php

namespace App\Panel\Admin\Resources\EventMemberTokenResource\Pages;

use App\Panel\Admin\Resources\EventMemberTokenResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateEventMemberToken extends CreateRecord
{
    protected static string $resource = EventMemberTokenResource::class;
}
