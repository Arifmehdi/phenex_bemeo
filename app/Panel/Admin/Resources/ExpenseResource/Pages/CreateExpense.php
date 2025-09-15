<?php

namespace App\Panel\Admin\Resources\ExpenseResource\Pages;

use App\Panel\Admin\Resources\ExpenseResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateExpense extends CreateRecord
{
    protected static string $resource = ExpenseResource::class;
}
