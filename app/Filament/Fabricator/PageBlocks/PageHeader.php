<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class PageHeader extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('page-header')
            ->schema([
                FileUpload::make('header_image')
                    ->directory('page-file')
                    ->disk('public')
                    ->helperText('Image size: 1894x378px')
                    ->rules([
                        'file',
                    ]),

                TextInput::make("heading")
                    ->required()
                    ->helperText('Html code supported. Use <br> for new line.')
                    ->maxLength(255),
            ]);
    }
}
