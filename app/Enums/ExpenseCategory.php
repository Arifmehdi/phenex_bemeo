<?php

namespace App\Enums;

use Filament\Support\Contracts\HasLabel;

enum ExpenseCategory: string implements HasLabel
{
    use EnumToArray;

    case MEMBERSHIP = 'membership';
    case CERTIFICATE = 'certificate';
    case SPONSOR = 'sponsor';

    case RENEW_MEMBERSHIP = 'renew-membership';
    case DONATION = 'donation';
    case OPENING   = 'opening';
    case EVENT = 'event';

    public function getLabel(): ?string
    {
        return ucwords(str_replace('-', ' ', $this->value));
    }
}
