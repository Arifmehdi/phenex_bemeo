<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\AdvertisementResource\Pages;
use App\Panel\Admin\Resources\AdvertisementResource\RelationManagers;
use App\Models\Advertisement;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AdvertisementResource extends Resource
{
    protected static ?string $model = Advertisement::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Advertisements';
    protected static ?string $pluralModelLabel = 'Home Ads';
    protected static ?string $modelLabel = 'Home Ad';

    public static function form(Form $form): Form
    {
        return $form
    ->schema([
        Forms\Components\TextInput::make('title')->required(),
        Forms\Components\Textarea::make('content'),
        Forms\Components\TextInput::make('link') // Add your link field
            ->label('Link')
            ->url()
            ->required(),
        Forms\Components\FileUpload::make('image')
            ->label('Image')
            ->image()
            ->directory('advertisements')
            ->disk('public')
            ->required(),
        Forms\Components\Toggle::make('is_active')->label('Active'),
        Forms\Components\DateTimePicker::make('show_from'),
        Forms\Components\DateTimePicker::make('show_until'),
    ]);

    }

    public static function table(Table $table): Table
    {
        return $table
    ->columns([
        Tables\Columns\TextColumn::make('title'),
        Tables\Columns\TextColumn::make('link')
    ->label('Link')
    ->url('link')
    ->openUrlInNewTab(),

        Tables\Columns\ImageColumn::make('image')
            ->label('Image')
            ->disk('public'),
        Tables\Columns\ToggleColumn::make('is_active'),
        Tables\Columns\TextColumn::make('show_from')->dateTime(),
        Tables\Columns\TextColumn::make('show_until')->dateTime(),
    ])
    ->filters([
        //
    ])
    ->actions([
        Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListAdvertisements::route('/'),
            'create' => Pages\CreateAdvertisement::route('/create'),
            'edit' => Pages\EditAdvertisement::route('/{record}/edit'),
        ];
    }
}