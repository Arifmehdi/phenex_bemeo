<?php

namespace App\Panel\Admin\Resources\ExpenseCategoryResource\Pages;

use App\Panel\Admin\Resources\ExpenseCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateExpenseCategory extends CreateRecord
{
    protected static string $resource = ExpenseCategoryResource::class;
}
