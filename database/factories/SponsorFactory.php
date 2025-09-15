<?php

namespace Database\Factories;

use App\Models\Expense;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Sponsor>
 */
class SponsorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'expense_id' => Expense::factory(), 
            'user_id' => User::factory(),
            'reason' => $this->faker->sentence(),
            'company_logo' => 'sponsors/' . $this->faker->uuid . '.png',
            'company_name' => $this->faker->company(),
            'company_address' => $this->faker->address(),
        ];
    }
}
