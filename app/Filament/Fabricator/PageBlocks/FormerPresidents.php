<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Section;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Builder\Block;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class FormerPresidents extends PageBlock
{

    public static function getBlockSchema(): Block
    {
        return Block::make('former-presidents')
            ->schema([
                Section::make('Former Presidents')
                    ->description('Add as many former presidents as you like.')
                    ->schema([
                        Repeater::make('presidents')
                            ->label('Presidents')
                            ->schema([
                                TextInput::make('name')->label('Name')->required(),
                                TextInput::make('time_period')->label('Time Period')->required(),
                                FileUpload::make('image')->label('Image')->directory('former-presidents')->required(),
                                Textarea::make('description')->label('Description'),
                            ])
                            ->collapsible()
                            ->minItems(1)
                            ->defaultItems(1)
                            ->addActionLabel('Add President'),
                    ]),
            ]);
    }
}