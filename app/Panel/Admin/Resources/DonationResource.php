<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\DonationResource\Pages;
use App\Models\Donation;
use App\Models\Expense;
use App\Enums\ExpenseCategory;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Actions\Action;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Filament\Notifications\Notification;

class DonationResource extends Resource
{
    protected static ?string $model = Donation::class;

      protected static bool $shouldRegisterNavigation = false;

    protected static ?string $navigationIcon = 'heroicon-o-gift';
    protected static ?string $navigationGroup = 'Finance'; // Or a suitable group
    protected static ?int $navigationSort = 7; // Adjust as needed

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Donation Details')
                    ->schema([
                        Select::make('user_id')
                            ->relationship('user', 'name')
                            ->searchable()
                            ->label('Donating User (if registered)'),
                        TextInput::make('donor_name')
                            ->maxLength(255),
                        TextInput::make('donor_email')
                            ->email()
                            ->maxLength(255),
                        TextInput::make('amount')
                            ->required()
                            ->numeric()
                            ->prefix('BDT'),
                        Textarea::make('message')
                            ->columnSpanFull(),
                        Toggle::make('is_anonymous')
                            ->label('Anonymous Donation'),
                    ])->columns(2),

                Forms\Components\Section::make('Payment Information')
                    ->schema([
                        Select::make('status')
                            ->options([
                                'pending' => 'Pending',
                                'successful' => 'Successful',
                                'failed' => 'Failed',
                                'refunded' => 'Refunded',
                            ])
                            ->required()
                            ->default('pending'),
                        Select::make('payment_method')
                            ->options([
                                'manual_bank_transfer' => 'Manual Bank Transfer',
                                'bkash' => 'bKash',
                                'nagad' => 'Nagad',
                                'card' => 'Card (Online)',
                            ]),
                        TextInput::make('transaction_id')
                            ->label('Transaction ID/Reference')
                            ->maxLength(255),
                        Select::make('expense_id')
                            ->relationship('expense', 'id')
                            ->label('Linked Expense Record (Income)')
                            ->searchable()
                            ->helperText('Auto-created if donation is successful and not linked.'),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable()->searchable(),
                TextColumn::make('donor_name')->searchable()->placeholder('Anonymous'),
                TextColumn::make('amount')->money('BDT')->sortable(),
                BadgeColumn::make('status')
                    ->colors([
                        'warning' => 'pending',
                        'success' => 'successful',
                        'danger' => 'failed',
                        'gray' => 'refunded',
                    ])->sortable(),
                TextColumn::make('payment_method')->sortable(),
                IconColumn::make('is_anonymous')->boolean()->label('Anonymous'),
                TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                SelectFilter::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'successful' => 'Successful',
                        'failed' => 'Failed',
                        'refunded' => 'Refunded',
                    ]),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
                Action::make('mark_successful')
                    ->label('Mark Successful & Record Income')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->requiresConfirmation()
                    ->visible(fn (Donation $record) => $record->status === 'pending' && !$record->expense_id)
                    ->action(function (Donation $record) {
                        DB::beginTransaction();
                        try {
                            $expense = Expense::create([
                                'date' => Carbon::now(),
                                'category' => ExpenseCategory::DONATION,
                                'type' => 'income',
                                'amount' => $record->amount,
                                'note' => "Donation ID: {$record->id} from " . ($record->is_anonymous ? 'Anonymous' : $record->donor_name),
                                'is_verified' => true,
                            ]);

                            $record->status = 'successful';
                            $record->expense_id = $expense->id;
                            $record->save();

                            DB::commit();
                            Notification::make()->title('Donation marked successful and income recorded.')->success()->send();
                        } catch (\Exception $e) {
                            DB::rollBack();
                            Notification::make()->title('Error: ' . $e->getMessage())->danger()->send();
                        }
                    }),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDonations::route('/'),
            'create' => Pages\CreateDonation::route('/create'),
            'edit' => Pages\EditDonation::route('/{record}/edit'),
            // 'view' => Pages\ViewDonation::route('/{record}'),
        ];
    }
}