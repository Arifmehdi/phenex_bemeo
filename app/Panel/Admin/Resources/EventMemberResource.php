<?php

namespace App\Panel\Admin\Resources;

use App\Models\Event;
use App\Models\EventMember;
use App\Models\EventMemberToken;
use App\Panel\Admin\Resources\EventMemberResource\Pages;
use App\Panel\Admin\Resources\EventMemberResource\RelationManagers\EventMemberTokensRelationManager;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\BulkAction;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Guava\FilamentModalRelationManagers\Actions\Table\RelationManagerAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class EventMemberResource extends Resource
{
    protected static ?string $model = EventMember::class;

    protected static ?string $navigationIcon = 'heroicon-o-globe-asia-australia';
    protected static ?int $navigationSort = 5;

    protected static ?string $navigationGroup = 'Event management';
    protected static bool $shouldRegisterNavigation = true;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('event_id')
                    ->relationship('event', 'title')
                    ->searchable()
                    ->required(),
                Forms\Components\Select::make('user_id')
                    ->relationship('user', 'name')
                    ->searchable()
                    ->required(),
                Forms\Components\TextInput::make('relation')
                    ->placeholder('বন্ধু, সহকর্মী...')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('amount')
                    ->numeric()
                    ->required(),
                Forms\Components\FileUpload::make('image')
                    ->directory('event_member_photos'),
                Forms\Components\Toggle::make('paid')
                    ->label('Has Paid?'),
                Forms\Components\Toggle::make('approved')
                    ->label('Approved by Admin?'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('event.title')->label('Event'),
                Tables\Columns\TextColumn::make('user.membership.company_name')->label('Company Name'),
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('relation'),
                Tables\Columns\TextColumn::make('amount')->money('BDT'),
                Tables\Columns\TextColumn::make('age'),
                Tables\Columns\IconColumn::make('paid')->boolean(),
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('created_at')->since(),
            ])
            ->searchable()
            ->filters([
                SelectFilter::make('event_id')
                    ->label('Event Title')
                    ->searchable()
                    ->options(fn() => Event::pluck('title', 'id')->toArray())
                    ->placeholder('All Events') // "All" দেখানোর জন্য
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when($data['value'] ?? null, fn($q, $eventId) => $q->where('event_id', $eventId));
                    }),

                Tables\Filters\TernaryFilter::make('paid')
                    ->label('Payment Status')
                    ->placeholder('All Payment Status')
                    ->trueLabel('Paid')
                    ->falseLabel('Unpaid'),

                Tables\Filters\Filter::make('created_at')
                    ->form([
                        Forms\Components\DatePicker::make('created_from'),
                        Forms\Components\DatePicker::make('created_until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn(Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn(Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    }),
            ])
            ->actions([
                RelationManagerAction::make('token-relation-manager')
                    ->label('Tokens')
                    ->relationManager(EventMemberTokensRelationManager::make()),
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    BulkAction::make('generate_token')
                        ->label('Create Token')
                        ->icon('heroicon-o-key')
                        ->form([
                            TextInput::make('name')
                                ->label('Token Name')
                                ->required()
                                ->maxLength(255),
                        ])
                        ->action(function (array $data, Collection $records) {
                            foreach ($records as $record) {
                                EventMemberToken::create([
                                    'name' => $data['name'], // or you can generate one per record
                                    'event_member_id' => $record->id,
                                    'event_id' => $record->event_id, // make sure this exists
                                    'done_at' => null,
                                    'is_done' => false,
                                ]);
                            }

                            Notification::make()
                                ->title('Tokens created successfully.')
                                ->success()
                                ->send();
                        })
                        ->deselectRecordsAfterCompletion(),
                    ExportBulkAction::make(),
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            EventMemberTokensRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEventMembers::route('/'),
            'create' => Pages\CreateEventMember::route('/create'),
            'edit' => Pages\EditEventMember::route('/{record}/edit'),
        ];
    }
}
