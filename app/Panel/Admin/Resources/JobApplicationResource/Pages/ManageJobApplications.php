<?php

namespace App\Panel\Admin\Resources\JobApplicationResource\Pages;

use App\Panel\Admin\Resources\JobApplicationResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageJobApplications extends ManageRecords
{
    protected static string $resource = JobApplicationResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
