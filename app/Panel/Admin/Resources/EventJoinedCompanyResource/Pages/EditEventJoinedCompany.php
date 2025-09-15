<?php

namespace App\Panel\Admin\Resources\EventJoinedCompanyResource\Pages;

use App\Panel\Admin\Resources\EventJoinedCompanyResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditEventJoinedCompany extends EditRecord
{
    protected static string $resource = EventJoinedCompanyResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
