<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\RegisterAdsResource\Pages;
use App\Panel\Admin\Resources\RegisterAdsResource\RelationManagers;
use App\Models\RegisterAds;
use Filament\Forms;
use Filament\Forms\Components\{TextInput, Textarea, FileUpload, Toggle, Select};
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\{TextColumn, ImageColumn, ToggleColumn};
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Filters\SelectFilter;

class RegisterAdsResource extends Resource
{
    protected static ?string $model = RegisterAds::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Advertisements';
    protected static ?string $pluralModelLabel = 'Register Ads';
    protected static ?string $modelLabel = 'Register Ad';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')
                    ->label('Title')
                    ->required()
                    ->maxLength(255),

                Textarea::make('content')
                    ->label('Content')
                    ->rows(4)
                    ->placeholder('Enter ad content'),

                FileUpload::make('image')
                    ->label('Image')
                    ->directory('register-ads')
                    ->image()
                    ->imagePreviewHeight('150')
                    ->maxSize(2048),

                TextInput::make('link')
                    ->label('Ad Link')
                    ->placeholder('https://example.com'),

                Toggle::make('is_active')
                    ->label('Active')
                    ->default(true),

                Select::make('type')
                    ->label('Position')
                    ->options([
                        1 => 'Left Side',
                        2 => 'Right Side',
                    ])
                    ->required()
                    ->default(1),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('image')
                    ->label('Image')
                    ->square(),

                TextColumn::make('title')
                    ->label('Title')
                    ->sortable()
                    ->searchable(),

                TextColumn::make('type')
                    ->label('Position')
                    ->formatStateUsing(fn($state) => $state == 1 ? 'Left Side' : 'Right Side'),

                ToggleColumn::make('is_active')
                    ->label('Active'),

                TextColumn::make('created_at')
                    ->label('Created')
                    ->dateTime('d M Y'),
            ])
            ->filters([
                SelectFilter::make('type')
                    ->label('Position')
                    ->options([
                        1 => 'Left Side',
                        2 => 'Right Side',
                    ]),

                SelectFilter::make('is_active')
                    ->label('Status')
                    ->options([
                        1 => 'Active',
                        0 => 'Inactive',
                    ]),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
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
            'index' => Pages\ListRegisterAds::route('/'),
            'create' => Pages\CreateRegisterAds::route('/create'),
            'edit' => Pages\EditRegisterAds::route('/{record}/edit'),
        ];
    }
}
