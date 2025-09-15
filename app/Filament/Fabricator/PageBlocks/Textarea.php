<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Textarea as ComponentsTextarea;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class Textarea extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('textarea')
            ->schema([
                ComponentsTextarea::make('description')
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}