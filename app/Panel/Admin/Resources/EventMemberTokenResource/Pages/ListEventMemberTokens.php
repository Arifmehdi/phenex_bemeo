<?php

namespace App\Panel\Admin\Resources\EventMemberTokenResource\Pages;

use App\Models\Event;
use App\Models\EventMember;
use App\Models\EventMemberToken;
use App\Panel\Admin\Resources\EventMemberTokenResource;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ListRecords;

class ListEventMemberTokens extends ListRecords
{
    protected static string $resource = EventMemberTokenResource::class;

    protected function getHeaderActions(): array
    {
        return [

            Action::make('generateTokens')
                ->label('Generate Tokens')
                ->icon('heroicon-o-plus')
                ->form([
                    TextInput::make('name')
                        ->required()
                        ->maxLength(255),

                    Select::make('event_id')
                        ->label('Event')
                        ->relationship('event', 'title')
                        ->reactive()
                        ->required(),

                    Select::make('event_member_ids')
                        ->label('Event Members')
                        ->multiple()
                        ->helperText("If left blank, all members will be selected.")
                        ->options(
                            fn(callable $get) =>
                            $get('event_id')
                            ? EventMember::where('event_id', $get('event_id'))->pluck('name', 'id')
                            : []
                        ),
                ])
                ->action(function (array $data): void {
                    // যদি কোনো member সিলেক্ট না করা হয়, তাহলে event-এর সব member ধরো
                    $memberIds = $data['event_member_ids'] ?? [];

                    if (empty($memberIds)) {
                        $memberIds = EventMember::where('event_id', $data['event_id'])->pluck('id')->toArray();
                    }

                    foreach ($memberIds as $memberId) {
                        EventMemberToken::create([
                            'name' => $data['name'],
                            'event_id' => $data['event_id'],
                            'event_member_id' => $memberId,
                            'is_done' => false,
                        ]);
                    }

                    Notification::make()
                        ->title('Tokens generated successfully!')
                        ->success()
                        ->send();
                }),

            Action::make('print_token')
                ->label('Print Token')
                ->icon('heroicon-o-key')
                ->form([
                    Select::make('event_id')
                        ->label('Event Title')
                        ->searchable()
                        ->options(fn() => Event::pluck('title', 'id')->toArray())
                        ->placeholder('Select Event')
                        ->required()
                        ->reactive(), // এটি বাধ্যতামূলক যাতে নিচের ফিল্ড রি-রেন্ডার হয়

                    Select::make('token_name')
                        ->label('Select Token Name')
                        ->searchable()
                        ->options(function (callable $get) {
                            $eventId = $get('event_id');
                            if (!$eventId) {
                                return [];
                            }

                            // এখানে তোমার Token model অনুসারে সংশ্লিষ্ট token ফেরত দাও
                            return EventMemberToken::where('event_id', $eventId)
                                ->pluck('name', 'name')
                                ->toArray();
                        })
                        ->placeholder('Select Token')
                        ->required(),
                ])
                ->action(function (array $data) {
                    // Event ডাটা রিট্রিভ করুন
                    $token = EventMemberToken::where('event_id', $data['event_id'])
                        ->where('name', $data['token_name'])->get('id');

                    // যেকোনো টোকেন নাম লাগলে নিচে ব্যবহার করতে পারেন: $data['token_name']
        
                    $ids = $token->pluck('id')->toArray();
                    session(['print_token_ids' => $ids]);

                    return redirect()->route('print.tokens');
                }),
        ];
    }
}
