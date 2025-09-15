<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class SponsorCarousel extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('sponsor-carousel')
            ->schema([
                Placeholder::make('info')
                    ->label('Information')
                    ->content('This block will display a carousel of active sponsor logos fetched from the database. You can set a title and limit the number of sponsors shown.'),
                TextInput::make('display_limit')
                    ->label('Number of Sponsors to Display')
                    ->numeric()
                    ->default(10)
                    ->minValue(1)
                    ->helperText('The latest active sponsors will be shown.'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        // Fetch active sponsors
        $limit = $data['display_limit'] ?? 10;
        $data['sponsors'] = \App\Models\Sponsor::where('is_active', true)
            ->latest() // Optional: order by latest created
            ->take($limit)
            ->get();

        return $data;
    }
}