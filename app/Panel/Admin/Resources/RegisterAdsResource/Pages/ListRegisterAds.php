<?php

namespace App\Panel\Admin\Resources\RegisterAdsResource\Pages;

use App\Panel\Admin\Resources\RegisterAdsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRegisterAds extends ListRecords
{
    protected static string $resource = RegisterAdsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
