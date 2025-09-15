<?php

namespace App\Panel\Admin\Resources;

use App\Models\Event;
use App\Models\EventMemberToken;
use App\Panel\Admin\Resources\EventMemberTokenResource\Pages;
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\BulkAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class EventMemberTokenResource extends Resource
{
    protected static ?string $model = EventMemberToken::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 5;

    protected static ?string $navigationGroup = 'Event management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Select::make('event_member_id')
                    ->relationship('eventMember', 'id')
                    ->required()
                    ->searchable(),
                Select::make('event_id')
                    ->relationship('event', 'id')
                    ->required()
                    ->searchable(),
                DateTimePicker::make('done_at')
                    ->label('Done At'),
                Toggle::make('is_done')
                    ->label('Is Done'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('eventMember.name')->label('Member'),
                TextColumn::make('event.title')->label('Event'),
                Tables\Columns\TextColumn::make('done_at')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_done')
                    ->boolean()
                    ->label('Done'),
                TextColumn::make('created_at')->dateTime()->label('Created'),
            ])
            ->filters([
                SelectFilter::make('event_id')
                    ->label('Event Title')
                    ->searchable()
                    ->options(fn() => Event::pluck('title', 'id')->toArray())
                    ->placeholder('All Events') // "All" দেখানোর জন্য
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when($data['value'] ?? null, fn($q, $eventId) => $q->where('event_id', $eventId));
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    BulkAction::make('print_token')
                        ->label('Print Token')
                        ->icon('heroicon-o-key')
                        ->action(function (array $data, Collection $records) {
                            $ids = $records->pluck('id')->toArray();
                            session(['print_token_ids' => $ids]);

                            return redirect()->route('print.tokens');
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEventMemberTokens::route('/'),
        ];
    }
}
