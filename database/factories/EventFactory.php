<?php

namespace Database\Factories;

use App\Models\Event;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class EventFactory extends Factory
{
    protected $model = Event::class;

    public function definition(): array
    {
        return [
            'user_id' => User::factory(), // creates user if not provided
            'title' => $this->faker->sentence(3),
            'description' => $this->faker->paragraph(),
            'join_deadline' => $this->faker->dateTimeBetween('+1 days', '+1 month'),
            'image' => $this->faker->imageUrl(640, 480, 'event', true),
        ];
    }
}
