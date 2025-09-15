<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class GalleryOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('gallery-one')
            ->schema([
                TextInput::make('section_tagline')
                    ->label('Section Tagline')
                    ->default('Our Portfolio'),
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('Explore Our Work'),
                Repeater::make('images')
                    ->label('Gallery Images')
                    ->schema([
                        FileUpload::make('image')->label('Image')->directory('pageblock-gallery-one')->image()->required(),
                        TextInput::make('alt_text')->label('Alt Text'),
                        TextInput::make('category_filter_tag')->label('Category/Filter Tag (for frontend filtering)'),
                    ])
                    ->grid(3)
                    ->collapsible()
                    ->cloneable(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}