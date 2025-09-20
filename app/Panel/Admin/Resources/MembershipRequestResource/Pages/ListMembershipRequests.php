<?php

namespace App\Panel\Admin\Resources\MembershipRequestResource\Pages;

use App\Panel\Admin\Resources\MembershipRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMembershipRequests extends ListRecords
{
    protected static string $resource = MembershipRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
