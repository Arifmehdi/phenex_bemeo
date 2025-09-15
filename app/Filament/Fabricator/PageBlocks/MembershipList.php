<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class MembershipList extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('membership-list')
            ->schema([
                TextInput::make('section_tagline')
                    ->label('Section Tagline')
                    ->default('Our Valued Members'),
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('Meet Our Community'),
                TextInput::make('display_limit')
                    ->label('Number of Members to Display')
                    ->numeric()
                    ->default(10)
                    ->helperText('Actual member data will be fetched from the database.'),
                TextInput::make('button_text_all_members')
                    ->label('Button Text for "View All Members"'),
                TextInput::make('button_link_all_members')
                    ->label('Button Link for "View All Members" (URL)')
                    ->url(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}