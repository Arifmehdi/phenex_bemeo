<?php

namespace Database\Factories;

use App\Models\EventMember;
use App\Models\User;
use App\Models\Event;
use Illuminate\Database\Eloquent\Factories\Factory;

class EventMemberFactory extends Factory
{
    protected $model = EventMember::class;

    public function definition(): array
    {
        $imageDir = storage_path('app/public/event-members/images');
        $imageFile = $this->generateFakeImage($imageDir);

        return [
            'event_id' => Event::factory(),
            'user_id' => User::factory(),
            'name' => $this->faker->name(),
            'age' => $this->faker->numberBetween(18, 100),
            'image' => 'event-members/images/' . $imageFile,
            'relation' => $this->faker->randomElement(['বন্ধু', 'সহকর্মী', 'আত্মীয়']),
            'amount' => $this->faker->randomFloat(2, 100, 500),
            'paid' => $this->faker->boolean(70), // 70% chance paid
        ];
    }

    public function generateFakeImage($savePath, $fileName = null)
    {
        // Image size
        $width = 640;
        $height = 480;

        // Create blank image
        $image = imagecreatetruecolor($width, $height);

        // Set background color
        $bgColor = imagecolorallocate($image, 200, 200, 200); // light gray
        imagefilledrectangle($image, 0, 0, $width, $height, $bgColor);

        // Set text color
        $textColor = imagecolorallocate($image, 50, 50, 50); // dark gray

        // Add some text in the center
        $text = "Demo Image";
        $fontSize = 5; // Built-in font
        $textWidth = imagefontwidth($fontSize) * strlen($text);
        $textHeight = imagefontheight($fontSize);
        $x = ($width - $textWidth) / 2;
        $y = ($height - $textHeight) / 2;
        imagestring($image, $fontSize, $x, $y, $text, $textColor);

        // Save the image to a file
        if (!file_exists($savePath)) {
            mkdir($savePath, 0777, true);
        }

        $filename = uniqid('demo_') . '.png';
        imagepng($image, $savePath . '/' . $filename);

        // Free memory
        imagedestroy($image);

        return $fileName;
    }
}
