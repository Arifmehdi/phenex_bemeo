<?php

namespace Database\Seeders;

use App\Models\CertificateRequest;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CertificateRequestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CertificateRequest::factory()->count(50)->create(); // ৫০টি fake entry
    }
}
