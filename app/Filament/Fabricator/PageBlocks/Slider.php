<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Builder\Block;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;


class Slider extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('slider')
            ->schema([
                Repeater::make('items')
                    ->schema([
                        FileUpload::make('slider_image')
                            ->directory('page-file')
                            ->disk('public')
                            ->helperText('Image size: 1894x738')
                            ->rules([
                                'file',
                            ]),

                        TextInput::make("heading")
                            // ->required()
                            ->helperText('Html code supported. Use <br> for new line.')
                            ->maxLength(255),

                        TextInput::make("slug_line")
                            ->helperText('Html code supported. Use <br> for new line.')
                            ->maxLength(255),

                        Grid::make(12)
                            ->schema([
                                TextInput::make("button_text")
                                    ->columnSpan(4)
                                    ->maxLength(255),

                                TextInput::make("button_link")
                                    ->default("#")
                                    ->columnSpan(8)
                                    ->maxLength(500),
                            ]),
                    ])
                    ->minItems(1)
                    ->maxItems(100)
                    ->collapsible()
                    ->reorderable(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
