<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class BoardOfMembers extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('board-of-members')
            ->schema([
                Repeater::make('members')
                    ->schema([
                        TextInput::make('proprietor_name')->label('Proprietor Name')->required(),
                        TextInput::make('proprietor_title')->label('Proprietor Title')->default('Proprietor'),
                        FileUpload::make('photo')
                            ->label('Photo')
                            ->directory('page-content-members')
                            // ->image()
                            ->required(),
                        // TextInput::make('company_name')->label('Company Name')->required(),
                        // TextInput::make('membership_no')->label('Membership Number')->required(),
                        // Textarea::make('address')->label('Address')->rows(2)->required(),
                        // TextInput::make('mobile')->label('Mobile Number')->required(),
                        // TextInput::make('email')->label('Email')->email()->nullable(),
                        // TextInput::make('machine')->label('Machine'),
                        // TextInput::make('brand')->label('Brand'),
                        // TextInput::make('total_head')->label('Total Head'),
                        // Textarea::make('colours')->label('Colours')->rows(2),
                    ])
                    ->cloneable()
                    ->columns(2)
                    ->collapsible()
                    ->itemLabel(fn(array $state): ?string => $state['proprietor_name'] ?? null),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
