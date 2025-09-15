<?php

namespace App\Panel\Admin\Resources\SponsorResource\Pages;

use App\Panel\Admin\Resources\SponsorResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSponsor extends CreateRecord
{
    protected static string $resource = SponsorResource::class;
}
