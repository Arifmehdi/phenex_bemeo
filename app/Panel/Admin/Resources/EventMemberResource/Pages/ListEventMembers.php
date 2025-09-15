<?php

namespace App\Panel\Admin\Resources\EventMemberResource\Pages;

use App\Models\Event;
use App\Models\EventMember;
use App\Panel\Admin\Resources\EventMemberResource;
use Filament\Actions;
use Filament\Forms\Components\Select;
use Filament\Resources\Pages\ListRecords;

class ListEventMembers extends ListRecords
{
    protected static string $resource = EventMemberResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            Actions\Action::make('print_members')
                ->label('Print Members')
                ->icon('heroicon-o-printer')
                ->form([
                    Select::make('event_id')
                        ->label('Event Title')
                        ->searchable()
                        ->options(fn() => Event::pluck('title', 'id')->toArray())
                        ->placeholder('Select Event')
                        ->required(),
                ])
                ->action(function (array $data) {
                    session(['event_id' => $data['event_id']]);
                    return redirect()->route('print.event-members');
                }),
        ];
    }
}
