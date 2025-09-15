<?php

namespace App\Panel\Admin\Resources\EventMemberResource\Pages;

use App\Panel\Admin\Resources\EventMemberResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateEventMember extends CreateRecord
{
    protected static string $resource = EventMemberResource::class;
}
