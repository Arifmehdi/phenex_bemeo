<?php

namespace App\Panel\Admin\Resources;

use App\Models\CertificateRequest;
use App\Panel\Admin\Resources\CertificateRequestResource\Pages;
use App\Panel\Admin\Resources\CertificateRequestResource\RelationManagers;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Torgodly\Html2Media\Tables\Actions\Html2MediaAction;

class CertificateRequestResource extends Resource
{
    protected static ?string $model = CertificateRequest::class;

    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                // Personal Information Section
                Forms\Components\Section::make('Personal Information')
                    ->schema([
                        Forms\Components\TextInput::make('company_name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\Radio::make('company_type')
                            ->options([
                                'Proprietorship' => 'Proprietorship',
                                'Limited Company' => 'Limited Company',
                                'Foreign Joint Venture' => 'Foreign Joint Venture',
                            ])
                            ->required(),

                        Forms\Components\TextInput::make('director_name')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('nominated_director')
                            ->maxLength(255),

                        Forms\Components\Textarea::make('address')
                            ->required()
                            ->columnSpanFull(),

                        Forms\Components\TextInput::make('phone')
                            ->tel()
                            ->required(),

                        Forms\Components\TextInput::make('email')
                            ->email()
                            ->required()
                            ->maxLength(255),
                    ])->columns(2),

                // Service Fee Section
                Forms\Components\Section::make('Service Fee')
                    ->schema([
                        Forms\Components\TextInput::make('certificate_fee')
                            ->numeric()
                            ->required(),

                        Forms\Components\TextInput::make('receipt_no')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\DatePicker::make('date')
                            ->required(),

                        Forms\Components\TextInput::make('year')
                            ->numeric()
                            ->required()
                            ->minValue(1900)
                            ->maxValue(2100),
                    ])->columns(2),

                // Document Upload Section
                Forms\Components\Section::make('Document Upload')
                    ->schema([
                        Forms\Components\FileUpload::make('verification_image_path')
                            ->label('Trade License')
                            ->directory('certificate_docs')
                            ->acceptedFileTypes(['application/pdf', 'image/jpeg', 'image/png'])
                            ->maxSize(2048) // 2MB
                            ->required()
                            ->columnSpanFull(),
                    ]),
                Forms\Components\ViewField::make('qr_code_preview')
                    ->label('QR Code')
                    ->view('components.qr-code-preview'),

                Forms\Components\Radio::make('status')
                    ->options([
                        'Pending' => 'Pending',
                        'Collected' => 'Collected',
                    ])
                    ->required(),

                Forms\Components\DatePicker::make('certificate_collect_date'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('company_name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('company_type'),
                Tables\Columns\TextColumn::make('director_name'),
                Tables\Columns\TextColumn::make('status'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\Action::make('generate_qr')
                    ->label('Generate QR')
                    ->icon('heroicon-o-qr-code')
                    ->action(function ($record) {
                        // Build QR data
                        $qrData = 'ID: ' . $record->id . ', Name: ' . $record->company_name . ', Phone: ' . $record->phone . " This is verify";

                        $response = Http::withOptions(['verify' => false])->get('https://api.qrserver.com/v1/create-qr-code/', [
                            'size' => '300x300',
                            'data' => $qrData,
                        ]);


                        $fileName = 'qrcodes/membership_' . $record->id . '.png';
                        Storage::disk('public')->put($fileName, $response->body());

                        // Save only the relative path in DB
                        $record->update([
                            'qr_code_path' => $fileName
                        ]);


                        // Notify success
                        Notification::make()
                            ->title('QR Code generated successfully!')
                            ->success()
                            ->send();
                    }),
                Action::make('download_photo')
                    ->label('Download QR')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->url(fn($record) => route('qrcode.downloadPhoto', $record))
                    ->openUrlInNewTab(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    ExportBulkAction::make()
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
            'index' => Pages\ListCertificateRequests::route('/'),
            // 'create' => Pages\CreateCertificateRequest::route('/create'),
            // 'edit' => Pages\EditCertificateRequest::route('/{record}/edit'),
        ];
    }
}
