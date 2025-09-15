<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class ContactOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('contact-one')
            ->schema([
                \Filament\Forms\Components\TextInput::make('title')
                    ->label('Section Title')
                    ->default('Love to hear from you'),

                \Filament\Forms\Components\TextInput::make('tagline')
                    ->label('Tagline')
                    ->default('Contact with us'),

                \Filament\Forms\Components\Textarea::make('description')
                    ->label('Description')
                    ->default('Man braid hell of edison bulb four brunch subway tile authentic, chillwave put a bird on church-key try-hard ramps heirloom.'),

                \Filament\Forms\Components\Repeater::make('socialLinks')
                    ->label('Social Links')
                    ->schema([
                        \Filament\Forms\Components\Select::make('platform')
                            ->options([
                                'twitter' => 'Twitter',
                                'facebook' => 'Facebook',
                                'pinterest' => 'Pinterest',
                                'instagram' => 'Instagram',
                            ]),
                        \Filament\Forms\Components\TextInput::make('url')
                            ->url(),
                    ]),

                \Filament\Forms\Components\TextInput::make('formAction')
                    ->label('Form Action URL')
                    ->default('theme-assets/inc/sendemail.php'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
