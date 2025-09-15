<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class FunfactTwo extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('funfact-two')
            ->schema([
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('Our Achievements'),
                Repeater::make('items')
                    ->label('Fact Items')
                    ->schema([
                        TextInput::make('icon_class')
                            ->label('Icon Class'),
                        TextInput::make('count_number')->label('Number')->numeric()->required(),
                        TextInput::make('title')->label('Title of the Fact')->required(),
                        Textarea::make('description')->label('Short Description')->rows(2),
                    ])
                    ->defaultItems(3)
                    ->grid(3)
                    ->collapsible(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}