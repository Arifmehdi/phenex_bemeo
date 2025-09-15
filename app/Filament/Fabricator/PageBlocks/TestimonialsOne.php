<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class TestimonialsOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('testimonials-one')
            ->schema([
                FileUpload::make('background_image')
                    ->label('Background Image')
                    ->directory('pageblock-testimonials')
                    ->image(),
                Repeater::make('gallery_images')
                    ->label('Gallery Images (Floating on Left)')
                    ->schema([
                        FileUpload::make('image')
                            ->label('Image')
                            ->directory('pageblock-testimonials/gallery')
                            ->image()
                            ->required(),
                        TextInput::make('alt_text')
                            ->label('Alt Text'),
                    ])
                    ->collapsible()
                    ->defaultItems(5)
                    ->maxItems(5) // Assuming 5 gallery images as in the original HTML
                    ->grid(2),
                TextInput::make('section_tagline')
                    ->label('Section Tagline')
                    ->default('Latest Updates'),
                TextInput::make('section_title')
                    ->label('Section Title')
                    ->default('Important Notices'),
                Textarea::make('section_description')
                    ->label('Section Description')
                    ->rows(3)
                    ->default('Stay informed with the latest announcements and updates from our organization.'),
                TextInput::make('button_text')
                    ->label('Button Text')
                    ->default('View All Notices'),
                TextInput::make('button_link')
                    ->label('Button Link (URL)')
                    ->url()
                    ->default("#"), // Link to notices index page
                TextInput::make('notice_display_limit')
                    ->label('Number of Notices to Display in Carousel')
                    ->numeric()
                    ->default(5)
                    ->minValue(1)
                    ->maxValue(20),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
