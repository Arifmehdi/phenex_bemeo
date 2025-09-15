<?php

namespace App\Panel\Admin\Resources\EventMemberResource\Pages;

use App\Panel\Admin\Resources\EventMemberResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditEventMember extends EditRecord
{
    protected static string $resource = EventMemberResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
