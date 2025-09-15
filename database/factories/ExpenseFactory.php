<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Expense>
 */
class ExpenseFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'date' => $this->faker->dateTimeBetween('-1 year', 'now')->format('Y-m-d'),
            'category' => $this->faker->randomElement([
                'Food',
                'Transport',
                'Office Supplies',
                'Utilities',
                'Salary',
                'Rent',
                'Investment'
            ]),
            'type' => $this->faker->randomElement(['income', 'expense']),
            'amount' => $this->faker->randomFloat(0, 100, 5000), // between 100 and 5000
            'note' => $this->faker->sentence(6),
            'is_verified' => $this->faker->boolean()
        ];
    }
}
