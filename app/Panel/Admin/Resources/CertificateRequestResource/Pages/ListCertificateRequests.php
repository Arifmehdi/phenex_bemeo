<?php

namespace App\Panel\Admin\Resources\CertificateRequestResource\Pages;

use App\Panel\Admin\Resources\CertificateRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListCertificateRequests extends ListRecords
{
    protected static string $resource = CertificateRequestResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // Actions\CreateAction::make(),
        ];
    }
}
