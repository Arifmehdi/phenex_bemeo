<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class GoogleMap extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('google-map')
            ->schema([
                Textarea::make('map_embed_url')
                    ->label('Google Maps Embed URL or Iframe Code')
                    ->helperText('You can get this from Google Maps > Share > Embed a map.')
                    ->rows(5),
                TextInput::make('height')
                    ->label('Map Height (e.g., 450px or 100%)')
                    ->default('450px'),
                // Optionally, if you want to use a JS library for maps:
                // TextInput::make('latitude')->label('Latitude'),
                // TextInput::make('longitude')->label('Longitude'),
                // TextInput::make('zoom_level')->label('Zoom Level')->numeric()->default(15),
                // TextInput::make('marker_title')->label('Marker Title'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}