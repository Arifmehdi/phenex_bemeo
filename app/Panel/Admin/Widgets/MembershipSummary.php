<?php

namespace App\Panel\Admin\Widgets;

use App\Models\Membership;
use App\Panel\Admin\Resources\MembershipResource;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class MembershipSummary extends BaseWidget
{
    protected ?string $heading = 'Membership Summary';

    protected ?string $description = 'An overview of total, active, and inactive memberships.';


    protected function getStats(): array
    {
        $totalCount = Membership::count();
        $activeCount = Membership::where('is_active', 1)->count();
        $inactiveCount = Membership::where('is_active', 0)->count();
        $totalDue = Membership::where('is_active', 1)->sum('due_amount');

        return [
            Stat::make('Total Memberships', number_format($totalCount))
                ->description('All memberships registered.')
                ->descriptionIcon('heroicon-m-users')
                ->color('info'),

            Stat::make('Active Memberships', number_format($activeCount))
                ->description('Currently active members.')
                ->descriptionIcon('heroicon-m-check-circle')
                ->color('success'),

            Stat::make('Inactive Memberships', number_format($inactiveCount))
                ->description('Members not currently active.')
                ->descriptionIcon('heroicon-m-x-circle')
                ->color('danger'),

            // total due
            Stat::make('Total Due', number_format($totalDue))
                ->description('Total amount due from active memberships.')
                ->descriptionIcon('heroicon-o-banknotes')
                ->color('warning')
                ->url(MembershipResource::getUrl('index', ['tableFilters' => ['due_amount' => ['from' => 1]]])),
        ];
    }
}
