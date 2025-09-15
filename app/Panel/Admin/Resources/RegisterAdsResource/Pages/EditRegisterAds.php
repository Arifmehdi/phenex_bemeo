<?php

namespace App\Panel\Admin\Resources\RegisterAdsResource\Pages;

use App\Panel\Admin\Resources\RegisterAdsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRegisterAds extends EditRecord
{
    protected static string $resource = RegisterAdsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
