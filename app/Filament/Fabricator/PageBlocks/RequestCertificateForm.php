<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class RequestCertificateForm extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('request-certificate-form')
            ->schema([
                TextInput::make('form_title')
                    ->label('Form Title')
                    ->default('Request a Certificate'),
                TextInput::make('form_tagline')
                    ->label('Form Tagline'),
                Textarea::make('form_description')
                    ->label('Form Introduction/Description')
                    ->rows(3),
                TextInput::make('submit_button_text')
                    ->label('Submit Button Text')
                    ->default('Submit Request'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}