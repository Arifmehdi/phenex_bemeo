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
        Schema::table('memberships', function (Blueprint $table) {
            // Personal Information
            $table->string('company_name')->nullable()->change();
            $table->enum('company_type', ['Limited Company', 'Proprietorship', 'Foreign Joint Venture'])->nullable()->change();
            $table->string('director_name')->nullable()->change();
            $table->text('address')->nullable()->change();
            $table->string('phone')->nullable()->change();
            $table->string('email')->nullable()->change();
            $table->enum('gender', ['Male', 'Female'])->nullable()->change();
            $table->decimal('membership_fee', 10, 2)->nullable()->change();

            // Matching Details
            $table->integer('machine_count')->nullable()->change();
            $table->string('brand')->nullable()->change();
            $table->string('total_head')->nullable()->change();
            $table->string('needle_colors')->nullable()->change();

            // Service Fee
            $table->decimal('yearly_subscription', 10, 2)->nullable()->change();
            $table->string('receipt_no')->nullable()->change();
            $table->date('payment_date')->nullable()->change();
            $table->integer('payment_year')->nullable()->change();

            // Status and foreign keys
            $table->foreignId('user_id')->nullable()->change();
            $table->boolean('is_active')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('memberships', function (Blueprint $table) {
            // Optional: reverse the nullable changes (if needed)
            $table->string('company_name')->nullable(false)->change();
            $table->enum('company_type', ['Limited Company', 'Proprietorship', 'Foreign Joint Venture'])->nullable(false)->change();
            $table->string('director_name')->nullable(false)->change();
            $table->text('address')->nullable(false)->change();
            $table->string('phone')->nullable(false)->change();
            $table->string('email')->nullable(false)->change();
            $table->enum('gender', ['Male', 'Female'])->nullable(false)->change();
            $table->decimal('membership_fee', 10, 2)->nullable(false)->change();

            $table->integer('machine_count')->nullable(false)->change();
            $table->string('brand')->nullable(false)->change();
            $table->string('total_head')->nullable(false)->change();
            $table->string('needle_colors')->nullable(false)->change();

            $table->decimal('yearly_subscription', 10, 2)->nullable(false)->change();
            $table->string('receipt_no')->nullable(false)->change();
            $table->date('payment_date')->nullable(false)->change();
            $table->integer('payment_year')->nullable(false)->change();

            $table->foreignId('user_id')->nullable(false)->change();
            $table->boolean('is_active')->nullable(false)->change();
        });
    }
};
