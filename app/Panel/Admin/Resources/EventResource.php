<?php

namespace App\Panel\Admin\Resources;

use Filament\Forms;
use Filament\Tables;
use App\Models\Event;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Actions\ActionGroup;
use App\Panel\Admin\Resources\EventResource\Pages;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Guava\FilamentModalRelationManagers\Actions\Table\RelationManagerAction;
use App\Panel\Admin\Resources\EventResource\RelationManagers\EventMemberRelationManager;
use App\Panel\Admin\Resources\EventResource\RelationManagers\EventCompaniesRelationManager;
use App\Panel\Admin\Resources\EventResource\RelationManagers\EventJoinedCompaniesRelationManager;

class EventResource extends Resource
{
    protected static ?string $model = Event::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?int $navigationSort = 1;
    protected static ?string $navigationGroup = 'Event management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('title')->required()->maxLength(255),
                Forms\Components\Textarea::make('description')->rows(3),
                Forms\Components\DateTimePicker::make('join_deadline')->required(),
                Forms\Components\FileUpload::make('image')
                    ->directory('event-photo'),
                Forms\Components\Checkbox::make('is_free')
                    ->label('Free Event')->default(false),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'DESC')
            ->columns([
                Tables\Columns\TextColumn::make('title')->searchable(),
                Tables\Columns\TextColumn::make('creator.name')->label('Created By'),
                Tables\Columns\IconColumn::make('is_free')
                    ->label('Free Event')
                    ->boolean(),
                Tables\Columns\TextColumn::make('join_deadline')->dateTime(),
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('created_at')->dateTime(),
            ])
            ->filters([
                //
            ])
            ->actions([
                ActionGroup::make([
                    RelationManagerAction::make('companies-relation-manager')
                        ->label('View Companies')
                        ->relationManager(EventJoinedCompaniesRelationManager::make()),
                    Tables\Actions\Action::make('Download')
                        ->url(fn($record) => route('event-member.pdf', $record))
                        ->openUrlInNewTab()
                        ->icon('heroicon-o-printer'),
                    Tables\Actions\Action::make('Badge')
                        ->url(fn($record) => route('badge.pdf', $record))
                        ->openUrlInNewTab()
                        ->icon('heroicon-o-printer'),
                    Tables\Actions\EditAction::make(),
                ]),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    ExportBulkAction::make(),
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            \App\Panel\Admin\Resources\EventResource\RelationManagers\EventMemberRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEvents::route('/'),
            'create' => Pages\CreateEvent::route('/create'),
            'edit' => Pages\EditEvent::route('/{record}/edit'),
        ];
    }
}
