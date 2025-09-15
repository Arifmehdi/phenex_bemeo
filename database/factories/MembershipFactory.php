<?php

namespace Database\Factories;

use App\Models\Membership;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class MembershipFactory extends Factory
{
    protected $model = Membership::class;

    public function definition()
    {
        $companyTypes = ['Limited Company', 'Proprietorship', 'Foreign Joint Venture'];
        $genders = ['Male', 'Female'];
        $machineCount = $this->faker->numberBetween(1, 20);

        // Calculate yearly subscription based on machine count
        if ($machineCount >= 10) {
            $yearlySubscription = 10000;
        } elseif ($machineCount >= 5) {
            $yearlySubscription = 5000;
        } else {
            $yearlySubscription = 2000;
        }

        return [
            'user_id' => \App\Models\User::factory(),
            'company_name' => $this->faker->company,
            'company_type' => $this->faker->randomElement($companyTypes),
            'director_name' => $this->faker->name,
            'nominated_director' => $this->faker->optional()->name,
            'address' => $this->faker->address,
            'telephone' => $this->faker->optional()->phoneNumber,
            'phone' => $this->faker->phoneNumber,
            'email' => $this->faker->unique()->safeEmail,
            'gender' => $this->faker->randomElement($genders),
            'membership_fee' => $this->faker->numberBetween(1000, 5000),
            'machine_count' => $machineCount,
            'brand' => $this->faker->randomElement(['Brother', 'Juki', 'Jack', 'Siruba', 'Yamata']),
            'total_head' => $this->faker->numberBetween(1, 50) . ' heads',
            'needle_colors' => $this->faker->numberBetween(1, 12) . ' colors',
            'yearly_subscription' => $yearlySubscription,
            'receipt_no' => 'RC-' . $this->faker->unique()->numberBetween(1000, 9999),
            'payment_date' => $this->faker->dateTimeBetween('-1 year', 'now'),
            'payment_year' => $this->faker->year,
            'sister_concerns' => $this->faker->optional()->company,
            'remarks' => $this->faker->optional()->sentence,
            'nomination_certificate' => 'membership/documents/' . $this->faker->uuid . '.jpg',
            'trade_license' => 'membership/documents/' . $this->faker->uuid . '.jpg',
            'factory_photos' => json_encode([
                'membership/factory_photos/' . $this->faker->uuid . '.jpg',
                'membership/factory_photos/' . $this->faker->uuid . '.jpg',
                'membership/factory_photos/' . $this->faker->uuid . '.jpg'
            ]),
            'director_photo' => 'membership/photos/' . $this->faker->uuid . '.jpg',
            'is_active' => $this->faker->boolean(90) // 90% chance of being active
        ];
    }
}
