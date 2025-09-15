<?php

namespace App\Panel\Admin\Resources\EventMemberTokenResource\Pages;

use App\Panel\Admin\Resources\EventMemberTokenResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditEventMemberToken extends EditRecord
{
    protected static string $resource = EventMemberTokenResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
