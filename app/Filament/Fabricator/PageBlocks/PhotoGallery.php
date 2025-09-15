<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class PhotoGallery extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('photo-gallery')
            ->label('Photo Gallery')
            ->schema([
                TextInput::make('gallery_title')
                    ->label('Gallery Title')
                    ->default('Our Photo Gallery'),
                Repeater::make('images')
                    ->label('Gallery Images')
                    ->schema([
                        FileUpload::make('image_path')->label('Image')->image()->directory('photo-gallery-images')->required(),
                        TextInput::make('caption')->label('Image Caption/Text'),
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
