<?php
namespace App\Panel\Admin\Resources;

use App\Models\Sponsor;
use App\Panel\Admin\Resources\SponsorResource\Pages;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class SponsorResource extends Resource
{
    protected static ?string $model = Sponsor::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('expense_category_id')
                    ->label('Income')
                    ->relationship('expense_category', 'name')
                    ->searchable(),

                Select::make('user_id')
                    ->label('User')
                    ->relationship('user', 'name')
                    ->searchable()
                    ->required(),

                Textarea::make('reason')
                    ->label("Sponsor's Reason")
                    ->nullable(),

                FileUpload::make('company_logo')
                    ->label('Company Logo')
                    ->directory('sponsors')
                    ->image()
                    ->imagePreviewHeight('150')
                    ->nullable(),

                TextInput::make('company_name')
                    ->label('Company Name')
                    ->required()
                    ->maxLength(255),
                    

                TextInput::make('amount')
                    ->label('Amount')
                    ->numeric()
                    ->prefix('BDT')
                    ->required(),

                Textarea::make('company_address')
                    ->label('Company Address')
                    ->nullable(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('payment_status')
                    ->label('Payment Status')
                    ->state(function (Sponsor $record): string {
                        if (is_null($record->expense_id) || is_null($record->expense)) {
                            return 'Unpaid';
                        }
                        return $record->expense->is_verified ? 'Paid' : 'Unverified';
                    })
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'Paid'                            => 'success',
                        'Unverified'                      => 'warning',
                        'Unpaid'                          => 'danger',
                        default                           => 'gray',
                    })
                    ->sortable()
                    ->searchable(),
                TextColumn::make('user.name')->label('User')->sortable()->searchable(),
                ToggleColumn::make('is_active')->toggleable(),
                ImageColumn::make('company_logo')->label('Logo')->circular(),
                TextColumn::make('company_name')->label('Company Name')->sortable()->searchable(),
                TextColumn::make('company_address')->label('Address')->limit(30),
                TextColumn::make('amount')
                    ->label('Amount')
                    ->prefix('BDT')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('reason')->label('Reason')->limit(30),
                TextColumn::make('created_at')->label('Created')->dateTime(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListSponsors::route('/'),
            'create' => Pages\CreateSponsor::route('/create'),
            'edit'   => Pages\EditSponsor::route('/{record}/edit'),
        ];
    }
}
