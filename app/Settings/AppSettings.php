<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class AppSettings extends Settings
{
    public string $app_name = 'Laravel';
    public ?string $app_logo = 'logo.png';
    public ?string $app_logo_dark = 'logo2.png';
    public ?string $app_favicon = 'logo.ico';

    // header setting
    public string $default_layout_address = 'Rajbari 7700 Dhaka, Bangladesh';
    public string $default_layout_email = 'contact.rajakhan@gmail.com';
    public string $default_layout_phone = '+8801866370585';

    // footer
    public string $about_text = 'About Us';
    public string $about_paragraph = 'Hello, We are a team of developers who are passionate about creating high-quality software solutions.';

    public $facebook_link = 'https://www.facebook.com';
    public $twitter_link = 'https://www.twitter.com';
    public $instagram_link = 'https://www.instagram.com';
    public $youtube_link = 'https://www.youtube.com';
    public $pinterest_link = 'https://www.pinterest.com';
    public string $copyright_text = '© Copyright <span class="dynamic-year"></span> by Marhab';

    public int $limited_company_fee = 10000;
    public int $proprietorship_fee = 5000;
    public int $foreign_joint_venture_fee = 20000;
    public int $partnership = 20000;

    public int $machine_fee_1_to_4 = 2000;
    public int $machine_fee_5_to_9 = 5000;
    public int $machine_fee_10_plus = 10000;

    public int $age_1_to_9 = 1000;
    public int $age_10_up = 2000;

    public ?int $subscription_fee = 120;
    public ?int $new_fee = 20;
    public ?int $life_member_fee = 10000;
    public ?int $donor_member_fee = 100000;


    public static function group(): string
    {
        return 'app';
    }
}
