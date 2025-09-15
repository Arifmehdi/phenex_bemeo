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
        Schema::create('donations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->onDelete('set null'); // If a registered user donates
            $table->string('donor_name')->nullable();
            $table->string('donor_email')->nullable();
            $table->decimal('amount', 10, 2);
            $table->string('currency')->default('BDT');
            $table->text('message')->nullable();
            $table->string('status')->default('pending'); // e.g., pending, successful, failed, refunded
            $table->string('payment_method')->nullable(); // e.g., manual_bank_transfer, bkash, card
            $table->string('transaction_id')->nullable(); // From payment gateway
            $table->boolean('is_anonymous')->default(false);
            $table->foreignId('expense_id')->nullable()->constrained()->onDelete('set null'); // Link to an expense record if it's an income
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('donations');
    }
};