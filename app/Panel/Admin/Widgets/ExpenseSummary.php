<?php

namespace App\Panel\Admin\Widgets;

use App\Models\Expense;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class ExpenseSummary extends BaseWidget
{
    protected ?string $heading = 'Income & Expense Overview';

    protected ?string $description = 'A quick summary of total income, expenses, balance, and entry counts to monitor your financial status at a glance.';

    protected function getStats(): array
    {
        $income = Expense::where('type', 'income')->sum('amount');
        $expense = Expense::where('type', 'expense')->sum('amount');
        $balance = $income - $expense;

        $verifiedCount = Expense::where('is_verified', true)->count();
        $unverifiedCount = Expense::where('is_verified', false)->count();
        $totalCount = Expense::count();

        return [
            Stat::make('Total Income', number_format($income, 0) . ' BDT')
                ->description('Total amount received')
                ->descriptionIcon('heroicon-o-arrow-trending-up')
                ->color('success')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses?tableFilters[is_verified][value]=&tableFilters[type][value]=income'"]),

            Stat::make('Total Expense', number_format($expense, 0) . ' BDT')
                ->description('Total amount spent')
                ->descriptionIcon('heroicon-o-arrow-trending-down')
                ->color('danger')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses?tableFilters[is_verified][value]=&tableFilters[type][value]=expense'"]),

            Stat::make('Balance', number_format($balance, 0) . ' BDT')
                ->description('Current balance')
                ->descriptionIcon('heroicon-o-banknotes')
                ->color('primary')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses'"]),

            Stat::make('Verified Entries', number_format($verifiedCount))
                ->description('Total verified records')
                ->descriptionIcon('heroicon-o-check-badge')
                ->color('success')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses?tableFilters[is_verified][value]=1'"]),

            Stat::make('Unverified Entries', number_format($unverifiedCount))
                ->description('Total unverified records')
                ->descriptionIcon('heroicon-o-exclamation-triangle')
                ->color('warning')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses?tableFilters[is_verified][value]=0'"]),

            Stat::make('Total Entries', number_format($totalCount))
                ->description('All income & expense records')
                ->descriptionIcon('heroicon-o-clipboard-document-list')
                ->color('info')
                ->extraAttributes(['onclick' => "window.location.href='/admin/expenses'"]),
        ];
    }
}
