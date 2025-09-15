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
        Schema::create('memberships', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            
            // Personal Information
            $table->string('company_name');
            $table->enum('company_type', ['Limited Company', 'Proprietorship', 'Foreign Joint Venture']);
            $table->string('director_name');
            $table->string('nominated_director')->nullable();
            $table->text('address');
            $table->string('telephone')->nullable();
            $table->string('phone');
            $table->string('email');
            $table->enum('gender', ['Male', 'Female']);
            $table->decimal('membership_fee', 10, 2);
            
            // Matching Details
            $table->integer('machine_count');
            $table->string('brand');
            $table->string('total_head');
            $table->string('needle_colors');
            
            // Service Fee
            $table->decimal('yearly_subscription', 10, 2);
            $table->string('receipt_no');
            $table->date('payment_date');
            $table->integer('payment_year');
            
            // Affiliated Organization
            $table->text('sister_concerns')->nullable();
            $table->text('remarks')->nullable();
            
            // Document Paths
            $table->string('nomination_certificate')->nullable();
            $table->string('trade_license')->nullable();
            $table->json('factory_photos')->nullable(); // Storing multiple images as JSON
            $table->string('director_photo')->nullable();
            
            // Status
            $table->boolean('is_active')->default(true);
            
            $table->timestamp('membership_expire_date')->nullable();
            $table->foreignId('expense_id')->nullable()->constrained();
            
            // Timestamps
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('memberships');
    }
};
