<?php

namespace App\Panel\Admin\Resources;

use App\Panel\Admin\Resources\MembershipRequestResource\Pages;
use App\Models\Membership;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class MembershipRequestResource extends Resource
{
    protected static ?string $model = Membership::class;

    protected static ?string $navigationIcon = 'heroicon-o-inbox-arrow-down';

    protected static ?string $navigationGroup = 'Membership Management';

    protected static ?string $label = 'Membership Requests';

    protected static ?string $slug = 'membership-requests';

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->latest();
        return parent::getEloquentQuery()->where('is_active', false);
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                // Service Fee Section
                // Forms\Components\Section::make('Service Fee')
                //     ->schema([
                //         Forms\Components\TextInput::make('due_amount')
                //             ->numeric()
                //             ->minValue(0),

                //         Forms\Components\TextInput::make('yearly_subscription')
                //             ->numeric()
                //             ->minValue(0),

                //         Forms\Components\TextInput::make('opening_balance')
                //             ->numeric()
                //             ->minValue(0),

                //         Forms\Components\TextInput::make('bad_debit')
                //             ->numeric()
                //             ->minValue(0),

                //         Forms\Components\TextInput::make('discount')
                //             ->label('Discount (%)')
                //             ->numeric()
                //             ->minValue(0)
                //             ->maxValue(100)
                //             ->default(0),

                //         Forms\Components\TextInput::make('advance_amount')
                //             ->label('Advance Amount')
                //             ->numeric()
                //             ->minValue(0)
                //             ->default(0),

                //         Forms\Components\TextInput::make('receipt_no')
                //             ->maxLength(255),

                //         Forms\Components\DatePicker::make('payment_date'),

                //         Forms\Components\TextInput::make('payment_year')
                //             ->numeric(),
                //     ])->columns(2),

                // Personal Information Section
                Forms\Components\Section::make('Personal Information')
                    ->schema([
                        Forms\Components\TextInput::make('membership_id')
                            ->required(),

                        Forms\Components\TextInput::make('full_name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('father_name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('phone')
                            ->label('Mobile')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\Select::make('profession')
                            ->options([
                                'Doctor' => 'Doctor',
                                'Business Man' => 'Business Man',
                                'Student' => 'Student',
                                'Other' => 'Other',
                            ])
                            ->required(),

                        Forms\Components\Select::make('profession_doc_type')
                            ->options([
                                'Certificate' => 'Certificate',
                                'Tin Certificate' => 'Tin Certificate',
                                'NID' => 'NID',
                                'Other' => 'Other',
                            ])
                            ->required(),

                        Forms\Components\FileUpload::make('profession_doc')
                            ->label('Upoload Document')
                            ->directory('membership/documents'),
                            // ->multiple()
                            // ->minFiles(3)
                            // ->maxFiles(5),

                        Forms\Components\TextInput::make('present_address')
                            ->required()
                            ->maxLength(255),
                            
                        // Forms\Components\TextInput::make('present_address')
                        //     ->tel()
                        //     ->maxLength(20)
                        //     ->nullable(),



                        Forms\Components\Select::make('permanent_address')
                            ->options([
                                'Dhaka' => 'Dhaka',
                                'Khulna' => 'Khulna',
                                'Chattogram' => 'Chattogram',
                                'Other' => 'Other',
                            ])
                            ->required(),

                        Forms\Components\Select::make('union_name')
                            ->options([
                                'Adhara' => 'Adhara',
                                'Hathajari' => 'Hathajari',
                                'Miradabad' => 'Miradabad',
                                'Other' => 'Other',
                            ])
                            ->required(),

                        Forms\Components\Select::make('ward')
                            ->options([
                                '1' => '1',
                                '2' => '2',
                                '3' => '3',
                                'Other' => 'Other',
                            ])
                            ->required(),

                        Forms\Components\Select::make('gender')
                            ->options([
                                'Male' => 'Male',
                                'Female' => 'Female',
                            ])
                            ->required(),

                        Forms\Components\TextInput::make('guardian_phone')
                            ->label('Gurdian Mobile')
                            ->required()
                            ->maxLength(20),

                        Forms\Components\TextInput::make('email')
                            ->email()
                            // ->required()
                            ->maxLength(255),



                        // Forms\Components\TextInput::make('membership_fee')
                        //     ->required()
                        //     ->numeric()
                        //     ->minValue(0),

                        // // existing_member
                        // Forms\Components\Checkbox::make('existing_member')
                    ])->columns(2),

                // // Matching Details Section
                // Forms\Components\Section::make('Matching Details')
                //     ->schema([
                //         Forms\Components\TextInput::make('machine_count')
                //             ->required()
                //             ->numeric()
                //             ->label('Machine quantity')
                //             ->minValue(0)
                //             ->live()
                //             ->afterStateUpdated(function ($state, Forms\Set $set) {
                //                 $set('yearly_subscription', match (true) {
                //                     $state >= 10 => 10000,
                //                     $state >= 5 => 5000,
                //                     default => 2000
                //                 });
                //             }),

                //         Forms\Components\TextInput::make('brand')
                //             ->maxLength(255),

                //         Forms\Components\TextInput::make('total_head')
                //             ->maxLength(255),

                //         Forms\Components\TextInput::make('needle_colors')
                //             ->maxLength(255),
                //     ])->columns(2),




                // // Affiliated Organization Section
                // Forms\Components\Section::make('Affiliated Organization')
                //     ->schema([
                //         Forms\Components\Textarea::make('sister_concerns')
                //             ->nullable()
                //             ->columnSpanFull(),

                //         Forms\Components\Textarea::make('remarks')
                //             ->nullable()
                //             ->columnSpanFull(),
                //     ]),

                // // Document Upload Section
                // Forms\Components\Section::make('Documents')
                //     ->schema([
                //         Forms\Components\FileUpload::make('nomination_certificate')
                //             ->disk('public') // Specify the disk
                //             ->directory('membership/documents') // Folder inside disk
                //             ->preserveFilenames() // Optional, to keep original filename
                //             ->downloadable() // Adds download option in edit form
                //             ->openable(), // Adds "open" link

                //         Forms\Components\FileUpload::make('trade_license')
                //             ->required()
                //             ->directory('membership/documents')->disk('public')->downloadable() // Adds download option in edit form
                //             ->openable(),

                //         Forms\Components\FileUpload::make('factory_photos')
                //             ->directory('membership/factory_photos')
                //             ->multiple()
                //             // ->minFiles(3)
                //             ->maxFiles(5),

                //         Forms\Components\FileUpload::make('director_photo')
                //             ->label('Managing director/proprietor photo')
                //             ->required()
                //             ->directory('membership/photos')->disk('public')->downloadable()
                //             ->openable(),
                //     ])->columns(2),

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
            ->columns([
                Tables\Columns\TextColumn::make('membership_id'),
                Tables\Columns\TextColumn::make('full_name'),
                Tables\Columns\TextColumn::make('phone'),
                Tables\Columns\TextColumn::make('email'),
                Tables\Columns\ToggleColumn::make('is_active'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\BulkAction::make('activate')
                        ->action(function ($records) {
                            $records->each->update(['is_active' => true]);
                        })
                        ->icon('heroicon-o-check-circle')
                        ->color('success'),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListMembershipRequests::route('/'),
            'create' => Pages\CreateMembershipRequest::route('/create'),
            'edit' => Pages\EditMembershipRequest::route('/{record}/edit'),
        ];
    }
}
