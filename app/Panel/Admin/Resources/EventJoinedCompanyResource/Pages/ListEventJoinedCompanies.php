<?php

namespace App\Panel\Admin\Resources\EventJoinedCompanyResource\Pages;

use App\Panel\Admin\Resources\EventJoinedCompanyResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListEventJoinedCompanies extends ListRecords
{
    protected static string $resource = EventJoinedCompanyResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // Actions\CreateAction::make(),
        ];
    }
}
