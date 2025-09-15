<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\CertificateRequest>
 */
class CertificateRequestFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'company_name' => $this->faker->company,
            'proprietor' => $this->faker->name,
            'director_partner' => $this->faker->optional()->name,
            'address' => $this->faker->address,
            'telephone' => $this->faker->optional()->phoneNumber,
            'mobile' => $this->faker->optional()->phoneNumber,
            'fax' => $this->faker->phoneNumber,
            'email' => $this->faker->unique()->safeEmail,
            'number_of_machines' => $this->faker->numberBetween(1, 20),
            'brand' => $this->faker->optional()->word,
            'total_head' => $this->faker->optional()->randomElement(['Single', 'Double', 'Multi']),
            'needle_colors' => $this->faker->optional()->numberBetween(4, 15) . ' colors',
            'yearly_subscription' => $this->faker->numberBetween(1000, 5000),
            'receipt_no' => $this->faker->optional()->bothify('RCPT-###??'),
            'payment_date' => $this->faker->date(),
            'subscription_year' => $this->faker->year(),
            'sister_units' => $this->faker->optional()->sentence(),
            'remarks' => $this->faker->optional()->sentence(10),
        ];
    }
}
