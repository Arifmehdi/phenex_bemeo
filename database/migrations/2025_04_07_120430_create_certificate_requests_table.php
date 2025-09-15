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
        Schema::create('certificate_requests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            
            // Personal Information
            $table->string('company_name');
            $table->string('company_type', 50);
            $table->string('director_name');
            $table->string('nominated_director')->nullable();
            $table->text('address');
            $table->string('phone');
            $table->string('email');
            
            // Service Fee
            $table->decimal('certificate_fee', 10, 2);
            $table->string('receipt_no');
            $table->date('date');
            $table->integer('year');
            
            // Document
            $table->string('verification_image_path');
            
            $table->timestamp('certificate_collect_date')->nullable();
            $table->string('status')->default('Pending');
            $table->foreignId('expense_id')->nullable()->constrained();

            $table->timestamps();
            
            // Foreign key
            $table->foreign('user_id')
                  ->references('id')
                  ->on('users')
                  ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('certificate_requests');
    }
};
