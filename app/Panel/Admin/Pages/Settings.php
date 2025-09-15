<?php
namespace App\Panel\Admin\Pages;

use App\Settings\AppSettings;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Pages\SettingsPage;
use Illuminate\Support\Facades\Http;
use Ysfkaya\FilamentPhoneInput\Forms\PhoneInput;
use Ysfkaya\FilamentPhoneInput\PhoneInputNumberType;

class Settings extends SettingsPage
{
    protected static ?string $navigationIcon = 'heroicon-o-cog-6-tooth';

    protected static ?int $navigationSort = 9;

    protected static string $settings = AppSettings::class;

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('System')
                    ->label(__('app-settings::app-settings.form.system'))
                    ->schema([
                        TextInput::make('app_name')
                            ->label(__('app-settings::app-settings.form.field.app.name'))
                            ->maxLength(255)
                            ->required()
                            ->columnSpanFull(),
                        Grid::make()->schema([
                            FileUpload::make('app_logo')
                                ->directory('assets')
                                ->visibility('public')
                                ->moveFiles(),

                            FileUpload::make('app_logo_dark')
                                ->directory('assets')
                                ->visibility('public')
                                ->moveFiles(),

                            FileUpload::make('app_favicon')
                                ->directory('assets')
                                ->visibility('public')
                                ->moveFiles(),
                        ])->columns(3),
                        TextInput::make('support_email')
                            ->label(__('app-settings::app-settings.form.field.app.support.email'))
                            ->prefixIcon('heroicon-o-envelope'),
                        PhoneInput::make('support_phone_1')
                            ->label(__('app-settings::app-settings.form.field.app.support.phone.1'))
                            ->rules(['phone'])
                            ->ipLookup(function () {
                                return rescue(fn() => Http::get('https://ipinfo.io/json')->json('country'), app()->getLocale(), report: false);
                            })
                            ->displayNumberFormat(PhoneInputNumberType::NATIONAL),
                    ])
                    ->columns(3)->collapsible(),

                Section::make('Layout Settings')
                    ->schema([
                        Section::make('Header Settings')->schema([
                            TextInput::make('default_layout_address')
                                ->label('Address')
                                ->required(),

                            TextInput::make('default_layout_email')
                                ->label('Email')
                                ->email()
                                ->required(),

                            TextInput::make('default_layout_phone')
                                ->label('Phone')
                                ->tel()
                                ->required(),
                        ]),

                        Section::make('Footer Settings')
                            ->schema([
                                TextInput::make('about_text')
                                    ->label('About Us Text')
                                    ->required(),

                                Textarea::make('about_paragraph')
                                    ->label('About Us Paragraph')
                                    ->rows(4)
                                    ->required(),

                                Textarea::make('copyright_text')
                                    ->label('Copyright Text')
                                    ->rows(2)
                                    ->required(),
                            ])
                            ->columns(2)
                            ->collapsible(),

                        Section::make('Social Link')
                            ->schema([
                                TextInput::make('facebook_link')
                                    ->label('Facebook Link')
                                    ->url(),

                                TextInput::make('twitter_link')
                                    ->label('Twitter Link')
                                    ->url(),

                                TextInput::make('instagram_link')
                                    ->label('Instagram Link')
                                    ->url(),

                                TextInput::make('youtube_link')
                                    ->label('YouTube Link')
                                    ->url(),

                                TextInput::make('pinterest_link')
                                    ->label('Pinterest Link')
                                    ->url(),
                            ])->columns(2),

                        Section::make('Fees')
                            ->schema([
                                TextInput::make('limited_company_fee')
                                    ->label('Limited Company Fee')
                                    ->numeric()
                                    ->default(10000)
                                    ->required(),
                                TextInput::make('proprietorship_fee')
                                    ->label('Proprietorship Fee')
                                    ->numeric()
                                    ->default(5000)
                                    ->required(),
                                TextInput::make('foreign_joint_venture_fee')
                                    ->label('Foreign Joint Venture Fee')
                                    ->numeric()
                                    ->default(20000)
                                    ->required(),
                                TextInput::make('partnership')
                                    ->label('Partnership Fee')
                                    ->numeric()
                                    ->default(0)
                                    ->required(),

                                TextInput::make('machine_fee_1_to_4')
                                    ->label('Machine Fee (1 to 4)')
                                    ->numeric()
                                    ->default(2000)
                                    ->required(),

                                TextInput::make('machine_fee_5_to_9')
                                    ->label('Machine Fee (5 to 9)')
                                    ->numeric()
                                    ->default(5000)
                                    ->required(),

                                TextInput::make('machine_fee_10_plus')
                                    ->label('Machine Fee (10+)')
                                    ->numeric()
                                    ->default(10000)
                                    ->required(),
                            ])->columns(2),

                        Section::make('Event Join Fee')
                            ->schema([

                                TextInput::make('age_1_to_9')
                                    ->label('Age 1 to 9')
                                    ->numeric()
                                    ->default(1000)
                                    ->required(),

                                TextInput::make('age_10_up')
                                    ->label('Age 10+')
                                    ->numeric()
                                    ->default(2000)
                                    ->required(),

                            ])->columns(2),

                    ])
                    ->columns(3)
                    ->collapsible(),
            ]);
    }

    protected function mutateFormDataBeforeSave(array $data): array
    {
        // dd($data);
        return $data;
    }
}