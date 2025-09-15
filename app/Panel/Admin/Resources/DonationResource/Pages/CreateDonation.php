<?php

namespace App\Panel\Admin\Resources\DonationResource\Pages;

use App\Panel\Admin\Resources\DonationResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateDonation extends CreateRecord
{
    protected static string $resource = DonationResource::class;
}
