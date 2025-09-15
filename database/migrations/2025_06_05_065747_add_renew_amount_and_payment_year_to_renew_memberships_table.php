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
        Schema::table('renew_memberships', function (Blueprint $table) {
            $table->integer('renew_amount')->nullable();
            $table->integer('payment_year')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('renew_memberships', function (Blueprint $table) {
            $table->dropColumn('renew_amount');
            $table->dropColumn('payment_year');
        });
    }
};
