<?php

namespace App\Panel\Admin\Resources\ExpenseResource\Pages;

use App\Models\Expense;
use Filament\Actions;
use Filament\Resources\Components\Tab;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use App\Panel\Admin\Resources\ExpenseResource;

class ListExpenses extends ListRecords
{
    protected static string $resource = ExpenseResource::class;

    public function getTabs(): array
    {
        return [
            'all' => Tab::make()->badge(Expense::query()->count())->badgeColor(''),
            'verified' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('is_verified', true))
                ->badge(Expense::query()->where('is_verified', true)->count())
                ->badgeColor('success'),
            'unverified' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('is_verified', false))
                ->badge(Expense::query()->where('is_verified', false)->count())
                ->badgeColor('warning'),
            'Income' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('type', 'income'))
                ->badge(Expense::query()->where('type', 'income')->count())
                ->badgeColor('info'),
            'Expense' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('type', 'expense'))
                ->badge(Expense::query()->where('type', 'expense')->count())
                ->badgeColor('danger'),
        ];
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
