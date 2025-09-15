<?php

namespace App\Providers\Filament;

use App\Panel\Admin\Widgets\ExpenseSummary;
use Bigraja\BulkSmsBD\Filament\Widgets\SmsBalanceWidget;
use CWSPS154\AppSettings\AppSettingsPlugin;
use Filament\Pages;
use Filament\Panel;
use Filament\Widgets;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Support\Enums\MaxWidth;
use Filament\Http\Middleware\Authenticate;
use Jeffgreco13\FilamentBreezy\BreezyCore;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Filament\Http\Middleware\AuthenticateSession;
use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Z3d0X\FilamentFabricator\FilamentFabricatorPlugin;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Datlechin\FilamentMenuBuilder\FilamentMenuBuilderPlugin;
use Firefly\FilamentBlog\Blog;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->authGuard('admin')
            ->login()
            ->databaseTransactions()
            ->maxContentWidth(MaxWidth::Full)
            ->colors([
                'primary' => Color::Emerald,
            ])
            ->discoverResources(in: app_path('Panel/Admin/Resources'), for: 'App\\Panel\\Admin\\Resources')
            ->discoverPages(in: app_path('Panel/Admin/Pages'), for: 'App\\Panel\\Admin\\Pages')
            ->pages([
                Pages\Dashboard::class,
            ])
            ->plugins([
                FilamentMenuBuilderPlugin::make()
                    ->navigationSort(8)
                    ->addLocations([
                        'header' => 'Header',
                        // 'footer' => 'Footer',
                        'footer_menu_one' => 'Footer Menu One',
                        'footer_menu_two' => 'Footer Menu Two',
                    ]),
                // FilamentShieldPlugin::make(),
                BreezyCore::make(),
                FilamentFabricatorPlugin::make(),
                // Blog::make(),
                // AppSettingsPlugin::make()

            ])
            ->discoverWidgets(in: app_path('Panel/Admin/Widgets'), for: 'App\\Panel\\Admin\\Widgets')
            ->widgets([
                ExpenseSummary::class,
                SmsBalanceWidget::class
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
