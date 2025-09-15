<?php

namespace App\Panel\Admin\Resources;

use App\Enums\ExpenseCategory;
use App\Models\Expense;
use App\Panel\Admin\Resources\ExpenseResource\Pages;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
// use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class ExpenseResource extends Resource
{
    protected static ?string $model = Expense::class;
    protected static ?string $navigationLabel = 'Income & Expense';
    protected static ?string $pluralModelLabel = 'Income & Expense';

    protected static ?string $modelLabel = 'Income / Expense';

    protected static ?string $navigationIcon = 'heroicon-o-banknotes';
    protected static ?int $navigationSort = 6;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\DatePicker::make('date')->required(),

                Forms\Components\Select::make('expense_category_id')
                    ->label('Category')
                    ->relationship('category', 'name')
                    ->required(),

                Forms\Components\TextInput::make('amount')->numeric()->required(),

                Forms\Components\Select::make('type')
                    ->options([
                        'income' => 'Income',
                        'expense' => 'Expense',
                    ])
                    ->required(),

                Forms\Components\Textarea::make('note')->rows(3),

                Forms\Components\FileUpload::make('images')
                    ->multiple()
                    ->directory('membership/payment_photos'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->searchable()
            ->defaultSort('created_at', 'DESC')
            ->columns([
                Tables\Columns\TextColumn::make('date')->date(),
                Tables\Columns\TextColumn::make('category'),
                Tables\Columns\TextColumn::make('category.name')->label('M.Category'),
                Tables\Columns\TextColumn::make('note'),
                Tables\Columns\TextColumn::make('amount')->money('BDT'),
                ToggleColumn::make('is_verified')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('type')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'income' => 'success',
                        'expense' => 'danger',
                        default => 'secondary',
                    }),
            ])
            ->filters([
                Filter::make('date')
                    ->form([
                        Forms\Components\DatePicker::make('created_from')->label('Date From'),
                        Forms\Components\DatePicker::make('created_until')->label('Date Until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn(Builder $query, $date): Builder => $query->whereDate('date', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn(Builder $query, $date): Builder => $query->whereDate('date', '<=', $date),
                            );
                    }),
                SelectFilter::make('is_verified')
                    ->options([
                        true => "Verified",
                        false => 'Unverified',
                    ]),
                SelectFilter::make('type')
                    ->options([
                        'income' => 'Income',
                        'expense' => 'Expense',
                    ]),
                SelectFilter::make('category')
                    ->options(collect(ExpenseCategory::cases())->mapWithKeys(fn($case) => [$case->value => $case->getLabel()])),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                // ExportBulkAction::make()
                //     ->exporter(ExpenseExport::class),
                Tables\Actions\DeleteBulkAction::make(),
                ExportBulkAction::make(),
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
            'index' => Pages\ListExpenses::route('/'),
            // 'create' => Pages\CreateExpense::route('/create'),
            // 'edit' => Pages\EditExpense::route('/{record}/edit'),
        ];
    }
}
