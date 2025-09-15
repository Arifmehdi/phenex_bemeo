<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\MembershipResource\Pages;
use App\Panel\Admin\Resources\MembershipResource\RelationManagers;
use App\Models\Membership;
use Bigraja\BulkSmsBD\Facades\BulkSmsBD;
use Filament\Forms;
use Filament\Forms\Components\Checkbox;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Filament\Tables\Actions\Action;
use Illuminate\Support\Facades\Storage;

class MembershipResource extends Resource
{
    protected static ?string $model = Membership::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';
    protected static ?int $navigationSort = 1;
    protected static ?string $navigationGroup = 'Membership Management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Personal Information Section
                Forms\Components\Section::make('Personal Information')
                    ->schema([
                        Forms\Components\TextInput::make('membership_id')
                            ->required(),

                        Forms\Components\TextInput::make('company_name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\Select::make('company_type')
                            ->options([
                                'Limited Company' => 'Limited Company',
                                'Proprietorship' => 'Proprietorship',
                                'Foreign Joint Venture' => 'Foreign Joint Venture',
                                'Partnership' => 'Partnership',
                            ])
                            ->required(),

                        Forms\Components\TextInput::make('director_name')
                            ->label('Managing director/propritor name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('nominated_director')
                            ->maxLength(255)
                            ->nullable(),

                        Forms\Components\Textarea::make('address')
                            ->required()
                            ->columnSpanFull(),

                        Forms\Components\TextInput::make('telephone')
                            ->tel()
                            ->maxLength(20)
                            ->nullable(),

                        Forms\Components\TextInput::make('phone')
                            ->label('Mobile number')
                            ->required()
                            ->maxLength(20),

                        Forms\Components\TextInput::make('email')
                            ->email()
                            ->required()
                            ->maxLength(255),

                        Forms\Components\Select::make('gender')
                            ->options([
                                'Male' => 'Male',
                                'Female' => 'Female',
                            ])
                            ->required(),

                        Forms\Components\TextInput::make('membership_fee')
                            ->required()
                            ->numeric()
                            ->minValue(0),

                        // existing_member
                        Forms\Components\Checkbox::make('existing_member')
                    ])->columns(2),

                // Matching Details Section
                Forms\Components\Section::make('Matching Details')
                    ->schema([
                        Forms\Components\TextInput::make('machine_count')
                            ->required()
                            ->numeric()
                            ->label('Machine quantity')
                            ->minValue(0)
                            ->live()
                            ->afterStateUpdated(function ($state, Forms\Set $set) {
                                $set('yearly_subscription', match (true) {
                                    $state >= 10 => 10000,
                                    $state >= 5 => 5000,
                                    default => 2000
                                });
                            }),

                        Forms\Components\TextInput::make('brand')
                            ->maxLength(255),

                        Forms\Components\TextInput::make('total_head')
                            ->maxLength(255),

                        Forms\Components\TextInput::make('needle_colors')
                            ->maxLength(255),
                    ])->columns(2),

                // Service Fee Section
                Forms\Components\Section::make('Service Fee')
                    ->schema([
                        Forms\Components\TextInput::make('due_amount')
                            ->numeric()
                            ->minValue(0),

                        Forms\Components\TextInput::make('yearly_subscription')
                            ->numeric()
                            ->minValue(0),

                        Forms\Components\TextInput::make('opening_balance')
                            ->numeric()
                            ->minValue(0),

                        Forms\Components\TextInput::make('bad_debit')
                            ->numeric()
                            ->minValue(0),

                        Forms\Components\TextInput::make('discount')
                            ->label('Discount (%)')
                            ->numeric()
                            ->minValue(0)
                            ->maxValue(100)
                            ->default(0),

                        Forms\Components\TextInput::make('advance_amount')
                            ->label('Advance Amount')
                            ->numeric()
                            ->minValue(0)
                            ->default(0),

                        Forms\Components\TextInput::make('receipt_no')
                            ->maxLength(255),

                        Forms\Components\DatePicker::make('payment_date'),

                        Forms\Components\TextInput::make('payment_year')
                            ->numeric(),
                    ])->columns(2),


                // Affiliated Organization Section
                Forms\Components\Section::make('Affiliated Organization')
                    ->schema([
                        Forms\Components\Textarea::make('sister_concerns')
                            ->nullable()
                            ->columnSpanFull(),

                        Forms\Components\Textarea::make('remarks')
                            ->nullable()
                            ->columnSpanFull(),
                    ]),

                // Document Upload Section
                Forms\Components\Section::make('Documents')
                    ->schema([
                        Forms\Components\FileUpload::make('nomination_certificate')
                            ->disk('public') // Specify the disk
                            ->directory('membership/documents') // Folder inside disk
                            ->preserveFilenames() // Optional, to keep original filename
                            ->downloadable() // Adds download option in edit form
                            ->openable(), // Adds "open" link

                        Forms\Components\FileUpload::make('trade_license')
                            ->required()
                            ->directory('membership/documents')->disk('public')->downloadable() // Adds download option in edit form
                            ->openable(),

                        Forms\Components\FileUpload::make('factory_photos')
                            ->directory('membership/factory_photos')
                            ->multiple()
                            // ->minFiles(3)
                            ->maxFiles(5),

                        Forms\Components\FileUpload::make('director_photo')
                            ->label('Managing director/proprietor photo')
                            ->required()
                            ->directory('membership/photos')->disk('public')->downloadable()
                            ->openable(),
                    ])->columns(2),

                // Hidden Fields
                Forms\Components\Hidden::make('user_id')
                    ->default(Auth::id()),

                Forms\Components\Toggle::make('is_active')
                    ->default(true),

                Forms\Components\DatePicker::make('membership_expire_date'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'DESC')
            ->columns([
                Tables\Columns\TextColumn::make('membership_id')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('company_name')
                    ->searchable()
                    ->sortable()
                    ->label('Company'),

                Tables\Columns\TextColumn::make('company_type')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'Limited Company' => 'primary',
                        'Proprietorship' => 'success',
                        'Partnership' => 'info',
                        'Foreign Joint Venture' => 'warning',
                    })
                    ->sortable(),

                Tables\Columns\TextColumn::make('director_name')
                    ->searchable()
                    ->label('Director')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('phone')
                    ->searchable()
                    ->label('Phone'),

                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->label('Email')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('machine_count')
                    ->numeric()
                    ->sortable()
                    ->label('Machines'),

                Tables\Columns\TextColumn::make('yearly_subscription')
                    ->money('BDT')
                    ->sortable()
                    ->label('Subscription')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('bad_debit')
                    ->money('BDT')
                    ->sortable()
                    ->label('Bad Debit')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('opening_balance')
                    ->money('BDT')
                    ->sortable()
                    ->label('Opening Balance')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('discount')
                    ->money('BDT')
                    ->sortable()
                    ->label('Discount')
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('payment_year')
                    ->numeric()
                    ->sortable()
                    ->label('Year')
                    ->toggleable(isToggledHiddenByDefault: true),

                ToggleColumn::make('is_active')
                    ->label('Active/Inactive')
                    ->sortable()
                    ->toggleable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('membership_expire_date')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: false),

                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('company_type')
                    ->options([
                        'Limited Company' => 'Limited Company',
                        'Proprietorship' => 'Proprietorship',
                        'Foreign Joint Venture' => 'Foreign Joint Venture',
                    ]),

                Tables\Filters\TernaryFilter::make('is_active')
                    ->label('Active Status')
                    ->trueLabel('Active')
                    ->falseLabel('Inactive'),

                Tables\Filters\Filter::make('due_amount')
                    ->form([
                        Forms\Components\TextInput::make('from')
                            ->label('Min Due Amount')
                            ->numeric()
                            ->prefix('৳'),

                        Forms\Components\TextInput::make('until')
                            ->label('Max Due Amount')
                            ->numeric()
                            ->prefix('৳'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query
                            ->when($data['from'], fn($q, $value) => $q->where('due_amount', '>=', $value))
                            ->when($data['until'], fn($q, $value) => $q->where('due_amount', '<=', $value));
                    }),

                Tables\Filters\Filter::make('membership_expire_date')
                    ->form([
                        Forms\Components\DatePicker::make('from')
                            ->label('From Date'),

                        Forms\Components\DatePicker::make('until')
                            ->label('To Date'),
                    ])
                    ->query(function ($query, array $data) {
                        return $query
                            ->when($data['from'], fn($q, $value) => $q->whereDate('membership_expire_date', '>=', $value))
                            ->when($data['until'], fn($q, $value) => $q->whereDate('membership_expire_date', '<=', $value));
                    }),

                Tables\Filters\Filter::make('created_at')
                    ->form([
                        Forms\Components\DatePicker::make('created_from'),
                        Forms\Components\DatePicker::make('created_until'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn(Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn(Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    }),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                Action::make('download_photo')
                    ->label('Download Photo')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->url(fn($record) => route('members.downloadPhoto', $record))
                    ->openUrlInNewTab(),
            ])->headerActions([
                Action::make('print_all')
                    ->label('Print All')
                    ->icon('heroicon-o-printer')
                    ->url(fn() => route('memberships.print', request()->query())) // passes current query (including filters)
                    ->openUrlInNewTab()
            ])




            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\BulkAction::make('send_sms')
                        ->label('Send SMS')
                        ->form([
                            Forms\Components\Textarea::make('template')
                                ->label('SMS Message')
                                ->placeholder('Write your message here...')
                                ->required(),
                        ])
                        ->action(function (\Illuminate\Database\Eloquent\Collection $records, array $data): void {
                            // $recipients = ["01866370585"]; // Test line

                            $recipients = $records->pluck('phone')->filter()->unique()->toArray();

                            // If phone numbers are on the user model and membership is linked to user:
                            // $userIds = $records->pluck('user_id')->filter()->unique()->toArray();
                            // $recipients = \App\Models\User::whereIn('id', $userIds)->pluck('mobile_number')->filter()->unique()->toArray();

                            $message = trim($data['template']);

                            if (empty($recipients)) {
                                Notification::make()
                                    ->title('No valid mobile numbers found.')
                                    ->danger()
                                    ->send();
                                return;
                            }

                            if ($message === '') {
                                Notification::make()
                                    ->title('Message is empty.')
                                    ->danger()
                                    ->send();
                                return;
                            }

                            if (!empty($recipients) && $message !== '') {
                                BulkSmsBD::sendBulk($recipients, $message);
                            }

                            Notification::make()
                                ->title('SMS sent successfully to ' . count($recipients) . ' recipients.')
                                ->success()
                                ->send();
                        })
                        ->icon('heroicon-o-check-circle')
                        ->color('success'),
                    Tables\Actions\BulkAction::make('activate')
                        ->action(function ($records) {
                            $records->each->update(['is_active' => true]);
                        })
                        ->icon('heroicon-o-check-circle')
                        ->color('success'),
                    Tables\Actions\BulkAction::make('deactivate')
                        ->action(function ($records) {
                            $records->each->update(['is_active' => false]);
                        })
                        ->icon('heroicon-o-x-circle')
                        ->color('danger'),
                    ExportBulkAction::make()
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
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
            'index' => Pages\ListMemberships::route('/'),
            'create' => Pages\CreateMembership::route('/create'),
            'edit' => Pages\EditMembership::route('/{record}/edit'),
            'view' => Pages\ViewMembership::route('/{record}'),
        ];
    }
}