<?php
namespace Database\Seeders;

use App\Models\Event;
use App\Models\EventMember;
use App\Models\Membership;
use App\Models\Sponsor;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'name'     => 'Test User',
            'email'    => 'admin@gmail.com',
            'password' => Hash::make('1234'),
            'is_admin' => true,
        ]);

        // // Create 10 fake memberships
        // Membership::factory()->count(10)->create();

        // Create 5 users (owners)
        User::factory(5)->create()->each(function ($owner) {

            // Create 10 fake memberships under this owner
            $memberships = Membership::factory()->count(10)->create([
                'user_id' => $owner->id,
            ]);

            // Each owner creates 2 events
            Event::factory(2)->create([
                'user_id' => $owner->id,
            ])->each(function ($event) use ($owner, $memberships) {

                $memberships->each(function ($membership) use ($event, $owner) {

                    EventMember::factory(random_int(4, 10))->create([
                        'event_id' => $event->id,
                        'user_id'  => $membership->user_id, // ← This is the fix
                        'relation' => fake()->randomElement(['বন্ধু', 'সহকর্মী', 'আত্মীয়']),
                    ]);
                });
            });
        });

        \App\Models\Expense::factory()->count(50)->create();

        Sponsor::factory()->count(10)->create();
    }
}
