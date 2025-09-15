<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;
use App\Models\Notice; // Make sure your Notice model is imported

class AllNotice extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('all-notice')
            ->label('All Notices')
            ->schema([
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('All Notices')
                    ->required(),
                TextInput::make('per_page')
                    ->label('Notices Per Page')
                    ->numeric()
                    ->default(10)
                    ->helperText('Number of notices to display per page.'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        // Ensure per_page is a positive integer, defaulting to 10.
        $perPage = max(1, (int) ($data['per_page'] ?? 10));
        $data['notices'] = Notice::where('is_active', true)
            ->latest() // Order by latest
            ->paginate($perPage);
        return $data;
    }
}