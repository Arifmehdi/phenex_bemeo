<?php

use Spatie\LaravelSettings\Migrations\SettingsBlueprint;
use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->inGroup('app', function (SettingsBlueprint $blueprint): void {
            // General app settings
            $blueprint->add('app_name', 'Bemea');
            $blueprint->add('app_logo', 'logo.png');
            $blueprint->add('app_logo_dark', 'logo2.png');
            $blueprint->add('app_favicon', 'logo.ico');

            // Header settings
            $blueprint->add('default_layout_address', 'Rajbari 7700 Dhaka, Bangladesh');
            $blueprint->add('default_layout_email', 'contact.rajakhan@gmail.com');
            $blueprint->add('default_layout_phone', '+8801866370585');

            // Footer settings
            $blueprint->add('about_text', 'About Us');
            $blueprint->add('about_paragraph', 'Hello, We are a team of developers who are passionate about creating high-quality software solutions.');

            // Social links
            $blueprint->add('facebook_link', 'https://www.facebook.com');
            $blueprint->add('twitter_link', 'https://www.twitter.com');
            $blueprint->add('instagram_link', 'https://www.instagram.com');
            $blueprint->add('youtube_link', 'https://www.youtube.com');
            $blueprint->add('pinterest_link', 'https://www.pinterest.com');

            // Copyright
            $blueprint->add('copyright_text', '© Copyright <span class="dynamic-year"></span> by Marhab');
        });
    }
};
