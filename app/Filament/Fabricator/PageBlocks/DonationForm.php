<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class DonationForm extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('donation-form')
            ->label('Donation Form')
            ->schema([
                TextInput::make('title')
                    ->label('Form Title')
                    ->default('Make a Donation'),
                Textarea::make('description')
                    ->label('Form Introduction/Description')
                    ->rows(3)
                    ->default('Your generous contribution helps us continue our work. Every amount makes a difference.'),
                TextInput::make('submit_button_text')
                    ->label('Submit Button Text')
                    ->default('Donate Now'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        $data['donation_form_action'] = route('donations.store');
        $data['csrf_token'] = csrf_token();
        $data['payment_methods'] = [ // Example, fetch dynamically or keep static
            'manual_bank_transfer' => 'Manual Bank Transfer',
            // Add other configured payment methods
        ];
        return $data;
    }
}
