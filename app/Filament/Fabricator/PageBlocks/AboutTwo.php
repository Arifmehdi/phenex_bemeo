<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class AboutTwo extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('about-two')
            ->schema([
                TextInput::make('section_tagline')
                    ->label('Section Tagline')
                    ->default('Know About Us'),
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('We are a trusted name in the industry'),
                Textarea::make('description_one')
                    ->label('First Paragraph Description')
                    ->rows(3),
                Textarea::make('description_two')
                    ->label('Second Paragraph Description')
                    ->rows(3),
                FileUpload::make('image_one')
                    ->label('Primary Image')
                    ->directory('pageblock-about-two')
                    ->image(),
                FileUpload::make('image_two')
                    ->label('Secondary Image')
                    ->directory('pageblock-about-two')
                    ->image(),
                TextInput::make('experience_years')
                    ->label('Years of Experience (Number)')
                    ->numeric()
                    ->default('10'),
                TextInput::make('experience_text')
                    ->label('Text next to experience years')
                    ->default('Years of Experience'),
                Repeater::make('list_items')
                    ->label('Highlight List Items')
                    ->schema([
                        TextInput::make('item_text')->required(),
                    ])
                    ->defaultItems(3)
                    ->collapsible(),
                TextInput::make('button_text')
                    ->label('Button Text'),
                TextInput::make('button_link')
                    ->label('Button Link (URL)')
                    ->url(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}