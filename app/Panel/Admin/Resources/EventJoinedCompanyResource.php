<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\EventJoinedCompanyResource\Pages;
use App\Models\EventJoinedCompany;
use App\Models\Event;
use App\Models\User;
use App\Panel\Admin\Resources\EventResource\RelationManagers\EventMemberRelationManager;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TernaryFilter;
use Filament\Tables\Table;
use Guava\FilamentModalRelationManagers\Actions\Table\RelationManagerAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class EventJoinedCompanyResource extends Resource
{
    protected static ?string $model = EventJoinedCompany::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?int $navigationSort = 2;
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
                Forms\Components\TextInput::make('amount')
                    ->numeric()
                    ->prefix('BDT')
                    ->required(),
                Forms\Components\Toggle::make('paid')
                    ->label('Can Paid?')
                    ->required(),
                Forms\Components\Select::make('expense_id')
                    ->relationship('expense', 'id') // Assuming 'id' or a more descriptive field like 'note' or 'category'
                    ->searchable()
                    ->nullable(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('event.title')->label('Event')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('user.name')->label('User/Company')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('amount')->money('BDT')->sortable(),
                Tables\Columns\ToggleColumn::make('paid')->label('Can Paid'),
                Tables\Columns\TextColumn::make('expense.id')->label('Expense ID')->searchable()->sortable(), // Or expense.note
                Tables\Columns\TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                SelectFilter::make('event_id')
                    ->label('Event')
                    ->options(Event::pluck('title', 'id')->all())
                    ->searchable(),
                SelectFilter::make('user_id')
                    ->label('User/Company')
                    ->options(User::pluck('name', 'id')->all()) // Assuming User model has a 'name' attribute
                    ->searchable(),
                TernaryFilter::make('paid')
                    ->label('Payment Status')
                    ->boolean()
                    ->trueLabel('Paid')
                    ->falseLabel('Unpaid')
                    ->placeholder('All'),
            ])
            ->actions([
                RelationManagerAction::make('viewMembers')
                    ->label('Members')
                    ->relationManager(EventMemberRelationManager::make()),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
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
            'index' => Pages\ListEventJoinedCompanies::route('/'),
            // 'create' => Pages\CreateEventJoinedCompany::route('/create'),
            // 'edit' => Pages\EditEventJoinedCompany::route('/{record}/edit'),
        ];
    }
}
