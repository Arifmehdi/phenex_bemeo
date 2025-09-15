<?php

namespace App\Panel\Admin\Resources\RenewMembershipResource\Pages;

use App\Panel\Admin\Resources\RenewMembershipResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRenewMemberships extends ListRecords
{
    protected static string $resource = RenewMembershipResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}