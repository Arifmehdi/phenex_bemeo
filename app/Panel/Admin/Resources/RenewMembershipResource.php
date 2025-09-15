<?php

namespace App\Panel\Admin\Resources;

use App\Enums\ExpenseCategory;
use App\Models\Expense;
use App\Models\Membership;
use App\Models\RenewMembership;
use App\Panel\Admin\Resources\RenewMembershipResource\Pages;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;

class RenewMembershipResource extends Resource
{
    protected static ?string $model = RenewMembership::class;

    protected static ?string $navigationIcon = 'heroicon-o-arrow-path';

    protected static ?string $navigationGroup = 'Membership Management';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Renewal Details')
                    ->schema([
                        Forms\Components\Select::make('user_id')
                            ->relationship('user', 'name')
                            ->searchable()
                            ->required()
                            ->columnSpanFull(),
                        Forms\Components\Select::make('membership_id')
                            ->relationship('originalMembership', 'company_name', modifyQueryUsing: fn (Builder $query) => $query->orderBy('company_name'))
                            ->label('Original Membership (Company)')
                            ->searchable()
                            ->required(),
                        Forms\Components\TextInput::make('machine_count')
                            ->numeric()
                            ->required()
                            ->label('Machine Count at Renewal'),
                        Forms\Components\TextInput::make('yearly_subscription')
                            ->numeric()
                            ->prefix('BDT')
                            ->required()
                            ->label('Yearly Subscription Fee at Renewal'),
                        Forms\Components\TextInput::make('payment_year')
                            ->numeric()
                            ->required()
                            ->label('Payment For (Years)'),
                        Forms\Components\TextInput::make('renew_amount')
                            ->numeric()
                            ->prefix('BDT')
                            ->required()
                            ->label('Renewal Amount (Subscription x Years)'),
                        Forms\Components\TextInput::make('due_amount')
                            ->numeric()
                            ->prefix('BDT')
                            ->default(0)
                            ->label('Previous Due Amount (if any)'),
                        Forms\Components\DatePicker::make('renew_expire_date')
                            ->required()
                            ->label('New Expiry Date'),
                        Forms\Components\FileUpload::make('director_photo')
                            ->directory('membership/photos')
                            ->image()
                            ->label('Director Photo (at time of renewal)'),
                    ])->columns(2),

                Forms\Components\Section::make('Status & Payment')
                    ->schema([
                        Forms\Components\Toggle::make('is_active')
                            ->label('Is Renewal Active?'),
                        Forms\Components\Select::make('expense_id')
                            ->relationship('expense', 'id') // Assuming Expense model has an 'id' or a more descriptive field
                            ->searchable()
                            ->label('Linked Expense Record (Income)'),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('originalMembership.company_name')
                    ->label('Company')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('User')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('renew_amount')
                    ->money('BDT')
                    ->sortable(),
                Tables\Columns\TextColumn::make('due_amount')
                    ->money('BDT')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('payment_year')
                    ->label('Years')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('renew_expire_date')
                    ->date()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\TernaryFilter::make('is_active')
                    ->label('Active Status'),
                Tables\Filters\Filter::make('created_at')
                    ->form([
                        Forms\Components\DatePicker::make('created_from'),
                        Forms\Components\DatePicker::make('created_until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('approve_renewal')
                    ->label('Approve & Record Payment')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->requiresConfirmation()
                    ->visible(fn (RenewMembership $record) => !$record->is_active || !$record->expense_id)
                    ->action(function (RenewMembership $record) {
                        DB::beginTransaction();
                        try {
                            $originalMembership = $record->originalMembership;
                            if (!$originalMembership) {
                                Notification::make()->title('Original membership not found.')->danger()->send();
                                return;
                            }

                            if (!$record->expense_id) {
                                $totalPayment = $record->renew_amount + $record->due_amount;
                                $expense = Expense::create([
                                    'date' => Carbon::now(),
                                    'category' => ExpenseCategory::RENEW_MEMBERSHIP,
                                    'type' => 'income',
                                    'amount' => $totalPayment,
                                    'note' => "Renewal for Membership ID: {$originalMembership->membership_id}, Company: {$originalMembership->company_name}, Renewal ID: {$record->id}. Payment for {$record->payment_year} year(s).",
                                    'is_verified' => true,
                                ]);
                                $record->expense_id = $expense->id;
                            }

                            $record->is_active = true;
                            $record->save();

                            // Update original membership
                            $originalMembership->membership_expire_date = $record->renew_expire_date;
                            $originalMembership->machine_count = $record->machine_count; // Update machine count
                            $originalMembership->yearly_subscription = $record->yearly_subscription; // Update yearly_subscription
                            // $originalMembership->director_photo = $record->director_photo; // If director photo on renewal should update main
                            $originalMembership->is_active = true;
                            $originalMembership->due_amount = 0; // Assuming previous dues are cleared with this renewal payment
                            $originalMembership->save();

                            DB::commit();
                            Notification::make()->title('Renewal approved and payment recorded. Membership updated.')->success()->send();
                        } catch (\Exception $e) {
                            DB::rollBack();
                            Notification::make()->title('Error: ' . $e->getMessage())->danger()->send();
                        }
                    }),
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
            'index' => Pages\ListRenewMemberships::route('/'),
            'create' => Pages\CreateRenewMembership::route('/create'),
            'edit' => Pages\EditRenewMembership::route('/{record}/edit'),
        ];
    }
}