<?php

namespace App\Panel\Admin\Resources\AdvertisementResource\Pages;

use App\Panel\Admin\Resources\AdvertisementResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateAdvertisement extends CreateRecord
{
    protected static string $resource = AdvertisementResource::class;
}
