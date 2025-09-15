<?php
namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class NewsletterOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('newsletter-one')
            ->schema([
                FileUpload::make('background_image')
                    ->label('Background Image')
                    ->directory('pageblock-newsletter-one')
                    ->image(),
                TextInput::make('title')
                    ->label('Title')
                    ->default('Subscribe to Our Newsletter'),
                Textarea::make('description')
                    ->label('Description')
                    ->rows(2)
                    ->default('Stay updated with our latest news and offers.'),
                TextInput::make('input_placeholder')
                    ->label('Email Input Placeholder Text')
                    ->default('Enter your email address'),
                TextInput::make('submit_button_text')
                    ->label('Submit Button Text')
                    ->default('Subscribe'),
                TextInput::make('form_action_url')
                    ->label('Form Action URL (if submitting to a service/route)')
                    ->url(),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}
