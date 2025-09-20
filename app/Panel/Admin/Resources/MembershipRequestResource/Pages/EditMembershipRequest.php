<?php

namespace App\Panel\Admin\Resources\MembershipRequestResource\Pages;

use App\Panel\Admin\Resources\MembershipRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMembershipRequest extends EditRecord
{
    protected static string $resource = MembershipRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
