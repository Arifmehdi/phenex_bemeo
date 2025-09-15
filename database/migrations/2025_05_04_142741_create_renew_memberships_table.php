<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('renew_memberships', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('membership_id')->constrained()->onDelete('cascade');
            
            // Matching Details
            $table->integer('machine_count');
            
            // Service Fee
            $table->decimal('yearly_subscription', 10, 2);
            
            $table->string('director_photo')->nullable();

            // Status
            $table->boolean('is_active')->default(true);
            
            $table->timestamp('renew_expire_date')->nullable();
            $table->foreignId('expense_id')->nullable()->constrained();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('renew_memberships');
    }
};
