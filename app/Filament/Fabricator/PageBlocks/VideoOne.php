<?php

namespace App\Filament\Fabricator\PageBlocks;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\TextInput;
use Z3d0X\FilamentFabricator\PageBlocks\PageBlock;

class VideoOne extends PageBlock
{
    public static function getBlockSchema(): Block
    {
        return Block::make('video-one')
            ->schema([
                FileUpload::make('background_image')
                    ->label('Background Image')
                    ->directory('pageblock-video-one')
                    ->image(),
                TextInput::make('video_popup_url')
                    ->label('Video Popup URL (e.g., YouTube link)')
                    ->url()
                    ->default('https://www.youtube.com/watch?v=CWCPovmNWK8'),
                Textarea::make('video_area_title')
                    ->label('Video Area Title')
                    ->helperText('Use <span> tags for dynamic counter if needed, e.g., Help us to donate <br> $<span class="count-text" data-stop="3800" data-speed="1500"></span> to poor childrens')
                    ->default('Help us to donate <br> $<span class="count-text" data-stop="3800" data-speed="1500"></span> to poor childrens'),
                Repeater::make('video_area_list_items')
                    ->label('Video Area List Items')
                    ->schema([
                        TextInput::make('item_text')->required(),
                    ])
                    ->default([
                        ['item_text' => 'If you are going to use a pass available'],
                        ['item_text' => 'Lorem ipsum the majority have suffered'],
                        ['item_text' => 'Totam rem aperiam eaque ipsam'],
                    ])
                    ->collapsible()
                    ->cloneable()
                    ->grid(2),

                // Form Section Titles (The form itself will be in blade, submitting to a controller)
                TextInput::make('form_section_title')
                    ->label('Form Section Title')
                    ->default('Apply For a Job'),
                TextInput::make('form_section_tagline')
                    ->label('Form Section Tagline')
                    ->default('Fill out the form below to submit your application.'),
                Textarea::make('form_section_description')
                    ->label('Form Section Description')
                    ->default('We are always looking for talented individuals. If you think you are a good fit, please apply.'),

                // This field is for the text on the submit button of the job application form
                TextInput::make('form_submit_button_text')
                    ->label('Form Submit Button Text')
                    ->default('Submit Application'),
            ]);
    }

    public static function mutateData(array $data): array
    {
        return $data;
    }
}