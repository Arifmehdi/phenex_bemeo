<?php

namespace App\Panel\Admin\Resources\EventJoinedCompanyResource\Pages;

use App\Panel\Admin\Resources\EventJoinedCompanyResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateEventJoinedCompany extends CreateRecord
{
    protected static string $resource = EventJoinedCompanyResource::class;
}
