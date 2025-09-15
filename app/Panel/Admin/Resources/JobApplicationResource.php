<?php

namespace App\Panel\Admin\Resources;

use App\Models\JobApplication;
use App\Panel\Admin\Resources\JobApplicationResource\Pages;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use pxlrbt\FilamentExcel\Actions\Tables\ExportBulkAction;
use Filament\Tables\Filters\TernaryFilter;

use Illuminate\Support\Facades\Mail;
use App\Mail\ShareJobApplicationToMembersMail;

class JobApplicationResource extends Resource
{
    protected static ?string $model = JobApplication::class;

    protected static ?string $navigationIcon  = 'heroicon-o-briefcase';
    protected static ?string $navigationGroup = 'Recruitment'; // Optional: Group it
    protected static ?int $navigationSort     = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Applicant Information')
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('email')
                            ->email()
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('phone')
                            ->tel()
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('location')
                            ->maxLength(255),
                    ])->columns(2),

                Section::make('Application Details')
                    ->schema([
                        Forms\Components\TextInput::make('desired_position')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\Textarea::make('message')
                            ->columnSpanFull(),
                    ])->columns(1),

                Section::make('Documents')
                    ->schema([
                        FileUpload::make('cv_path')
                            ->label('CV')
                            ->directory('job_applications/cvs')
                            ->acceptedFileTypes(['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']) // PDF, DOC, DOCX
                            ->maxSize(5120) // 5MB
                            ->required(),
                        FileUpload::make('photo_path')
                            ->label('Applicant Photo')
                            ->directory('job_applications/photos')
                            ->image(),
                    ])->columns(2),

                Section::make('Status')
                    ->schema([
                        Toggle::make('is_active')
                            ->label('Is Active')
                            ->default(true),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                ImageColumn::make('photo_path')->label('Photo')->circular()->defaultImageUrl(url('/images/default_avatar.png')),
                TextColumn::make('name')->searchable()->sortable(),
                TextColumn::make('email')->searchable(),
                TextColumn::make('phone')->searchable(),
                TextColumn::make('desired_position')->searchable()->toggleable(),
                IconColumn::make('is_active')->boolean(),
                TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                TernaryFilter::make('is_active')
                    ->label('Status')
                    ->trueLabel('Active')
                    ->falseLabel('Inactive')
                    ->placeholder('All'),
                Tables\Filters\Filter::make('created_at')
                    ->form([
                        DatePicker::make('created_from')->placeholder('From Date'),
                        DatePicker::make('created_until')->placeholder('Until Date'),
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
                Action::make('download_cv')
                    ->label('Download CV')
                    ->icon('heroicon-o-arrow-down-tray')
                    ->url(fn(JobApplication $record): string => asset('storage/' . $record->cv_path))
                    ->openUrlInNewTab()
                    ->visible(fn(JobApplication $record): bool => ! empty($record->cv_path)),

                // New action: Send CV + message to all registered event members
                Action::make('sendToMembers')
                    ->label('Send CV to All Members')
                    ->icon('heroicon-o-paper-airplane')
                    ->form([
                        Forms\Components\Textarea::make('message')
                            ->label('Message to Members')
                            ->required()
                            ->rows(5),
                    ])
                    ->action(function (JobApplication $record, array $data) {
                        $message = $data['message'];
                        $cvRelativePath = $record->cv_path;

                        // Build full path from Laravel's storage
                        $cvFullPath = storage_path('app/public/' . $cvRelativePath);

                        // Test with single email
                        if (!file_exists($cvFullPath)) {
                            throw new \Exception("CV file missing at: $cvFullPath");
                        }

                        $members = \App\Models\Membership::where('is_active', '1')->get();

                        foreach ($members as $member) {
                            if ($member->email) {
                                Mail::to($member->email)
                                    ->send(new ShareJobApplicationToMembersMail($message, $cvFullPath));
                            }
                        }

                        // Mail::to('asasif8899@gmail.com')   
                        //     ->send(new ShareJobApplicationToMembersMail($message, $cvFullPath));

                        \Filament\Notifications\Notification::make()
                            ->title('Success')
                            ->body('CV and message sent successfully.')
                            ->success()
                            ->send();
                    })

                    ->modalHeading('Send CV to Event Members')
                    ->modalSubmitActionLabel('Send Now'),

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
            'index' => Pages\ManageJobApplications::route('/'),
        ];
    }
}
