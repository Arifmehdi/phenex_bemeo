<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class RichEditor extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('rich-editor')
            ->schema([
                \Filament\Forms\Components\RichEditor::make('content')
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
