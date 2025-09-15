<?php

namespace App\Panel\Admin\Resources\CertificateRequestResource\Pages;

use App\Panel\Admin\Resources\CertificateRequestResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCertificateRequest extends CreateRecord
{
    protected static string $resource = CertificateRequestResource::class;
}
