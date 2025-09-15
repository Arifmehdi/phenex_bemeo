<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\ColorPicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class Heading extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('heading')
            ->schema([
                TextInput::make('heading')
                    ->label('Heading Text'),

                Select::make('alignment')
                    ->label('Alignment')
                    ->options([
                        'left' => 'Left',
                        'center' => 'Center',
                        'right' => 'Right',
                        'justify' => 'Justify',
                    ])
                    ->default('left'),

                Select::make('size')
                    ->label('Heading Size')
                    ->options([
                        'h1' => 'H1',
                        'h2' => 'H2',
                        'h3' => 'H3',
                        'h4' => 'H4',
                        'h5' => 'H5',
                        'h6' => 'H6',
                    ])
                    ->default('h2'),

                ColorPicker::make('color')
                    ->label('Text Color')
                    ->default('#000000'),

                ColorPicker::make('background')
                    ->label('Background Color')
                    ->default('#000000'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
