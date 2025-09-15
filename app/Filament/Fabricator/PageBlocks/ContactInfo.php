<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\Builder\Block;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class ContactInfo extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('contact-info')
            ->schema([
                Forms\Components\FileUpload::make('background_image')
                ->label('Background Image')
                ->directory('contact-info-backgrounds')
                ->image()
                ->required(),
                
            Forms\Components\Section::make('Email Information')
                ->schema([
                    Forms\Components\TextInput::make('email_1')
                        ->label('Primary Email')
                        ->email()
                        ->required(),
                        
                    Forms\Components\TextInput::make('email_2')
                        ->label('Secondary Email')
                        ->email()
                        ->required(),
                ]),
                
            Forms\Components\Section::make('Address')
                ->schema([
                    Forms\Components\Textarea::make('address')
                        ->label('Full Address')
                        ->required()
                        ->rows(3),
                ]),
                
            Forms\Components\Section::make('Phone Numbers')
                ->schema([
                    Forms\Components\TextInput::make('phone_1')
                        ->label('Primary Phone')
                        ->tel()
                        ->required(),
                        
                    Forms\Components\TextInput::make('phone_2')
                        ->label('Secondary Phone')
                        ->tel()
                        ->required(),
                ]),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}