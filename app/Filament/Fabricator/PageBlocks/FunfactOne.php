<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class FunfactOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('funfact-one')
            ->schema([
                FileUpload::make('background_image')
                    ->label('Background Image')
                    ->directory('pageblock-funfact-one')
                    ->image(),
                Repeater::make('items')
                    ->label('Fun Fact Items')
                    ->schema([
                        TextInput::make('icon_class')
                            ->label('Icon Class (e.g., FontAwesome class)')
                            ->helperText('Alternatively, you can use an image icon below.'),
                        FileUpload::make('icon_image')
                            ->label('Icon Image (Overrides class if set)')
                            ->directory('pageblock-funfact-one/icons')
                            ->image(),
                        TextInput::make('count_number')->label('Number to Count To')->numeric()->required(),
                        TextInput::make('count_text')->label('Text After Number (e.g., Projects Done)')->required(),
                    ])
                    ->defaultItems(4)
                    ->grid(2)
                    ->collapsible(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}