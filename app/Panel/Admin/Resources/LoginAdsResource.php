<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\LoginAdsResource\Pages;
use App\Panel\Admin\Resources\LoginAdsResource\RelationManagers;
use App\Models\LoginAds;
use Filament\Forms;
use Filament\Forms\Components\{TextInput, Textarea, FileUpload, Toggle, Select};
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Columns\{TextColumn, ImageColumn, ToggleColumn};
use Filament\Tables\Filters\SelectFilter;

class LoginAdsResource extends Resource
{
    protected static ?string $model = LoginAds::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Advertisements';
    protected static ?string $pluralModelLabel = 'Login Ads';
    protected static ?string $modelLabel = 'Login Ad';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('title')
                    ->required()
                    ->maxLength(255),

                Textarea::make('content')
                    ->rows(4)
                    ->placeholder('Enter ad content'),

                FileUpload::make('image')
                    ->directory('login-ads')
                    ->image()
                    ->imagePreviewHeight('150')
                    ->maxSize(2048),

                TextInput::make('link')
                    ->placeholder('https://example.com'),

                Toggle::make('is_active')
                    ->label('Active')
                    ->default(true),

                Select::make('type')
                    ->options([
                        1 => 'Left Side',
                        2 => 'Right Side',
                    ])
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('image')->label('Image')->square(),
                TextColumn::make('title')->sortable()->searchable(),
                TextColumn::make('type')
                    ->label('Position')
                    ->formatStateUsing(fn($state) => $state == 1 ? '1' : '2'),
                ToggleColumn::make('is_active')->label('Active'),
                TextColumn::make('created_at')->dateTime('d M Y'),
            ])
            ->filters([
                SelectFilter::make('type')
                    ->options([
                        1 => 'Left Side',
                        2 => 'Right Side',
                    ]),
                SelectFilter::make('is_active')
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
            'index' => Pages\ListLoginAds::route('/'),
            'create' => Pages\CreateLoginAds::route('/create'),
            'edit' => Pages\EditLoginAds::route('/{record}/edit'),
        ];
    }
}
