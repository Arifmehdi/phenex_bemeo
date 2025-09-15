<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class CtaOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('cta-one')
            ->schema([
                FileUpload::make('background_image')
                    ->label('Background Image')
                    ->directory('pageblock-cta-one')
                    ->image(),
                TextInput::make('title')
                    ->label('Title')
                    ->default('Ready to Get Started?'),
                TextInput::make('subtitle')
                    ->label('Subtitle/Description'),
                TextInput::make('button_text')
                    ->label('Button Text')
                    ->default('Contact Us'),
                TextInput::make('button_link')
                    ->label('Button Link (URL)')
                    ->url(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}