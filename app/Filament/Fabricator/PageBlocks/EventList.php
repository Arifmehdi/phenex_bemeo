<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class EventList extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('event-list')
            ->schema([
                TextInput::make('section_tagline')
                    ->label('Section Tagline')
                    ->default('Upcoming Events'),
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('Join Our Exciting Events'),
                TextInput::make('display_limit')
                    ->label('Number of Events to Display')
                    ->numeric()
                    ->default(3)
                    ->helperText('The actual events will be fetched from the database.'),
                TextInput::make('button_text_all_events')
                    ->label('Button Text for "View All Events"'),
                TextInput::make('button_link_all_events')
                    ->label('Button Link for "View All Events" (URL)')
                    ->url(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}