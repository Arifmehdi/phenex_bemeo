<?php

namespace App\Panel\Admin\Resources\EventResource\RelationManagers;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Resources\RelationManagers\RelationManager;
use Guava\FilamentModalRelationManagers\Actions\Table\RelationManagerAction;

class EventJoinedCompaniesRelationManager extends RelationManager
{
    protected static string $relationship = 'EventJoinedCompanies';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('amount')
                    ->numeric()
                    ->prefix('BDT')
                    ->required(),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('name')
            ->columns([
                Tables\Columns\TextColumn::make('user.membership.membership_id'),
                Tables\Columns\TextColumn::make('user.name')->label('User')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('user.membership.company_name')->label('Company')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('amount')->money('BDT')->sortable(),
                Tables\Columns\ToggleColumn::make('paid')
                    ->afterStateUpdated(function ($record, $state) {
                        $record->amount = $record->eventMembers()->where('approved', true)->get()->sum('amount');
                        $record->save();
                    })
                    ->label('Can Paid'),
                Tables\Columns\TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->headerActions([
            ])
            ->actions([
                RelationManagerAction::make('user-relation-manager')
                    ->label('View Joined')
                    ->relationManager(EventMemberRelationManager::make()),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
