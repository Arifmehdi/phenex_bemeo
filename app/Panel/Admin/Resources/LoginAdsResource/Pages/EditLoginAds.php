<?php

namespace App\Panel\Admin\Resources\LoginAdsResource\Pages;

use App\Panel\Admin\Resources\LoginAdsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLoginAds extends EditRecord
{
    protected static string $resource = LoginAdsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
