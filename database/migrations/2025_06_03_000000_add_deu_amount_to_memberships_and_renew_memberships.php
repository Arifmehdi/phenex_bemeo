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
            $table->decimal('due_amount', 10, 2)->default(0)->after('membership_fee');
        });
        Schema::table('renew_memberships', function (Blueprint $table) {
            $table->decimal('due_amount', 10, 2)->default(0)->after('yearly_subscription');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('memberships', function (Blueprint $table) {
            $table->dropColumn('due_amount');
        });
        Schema::table('renew_memberships', function (Blueprint $table) {
            $table->dropColumn('due_amount');
        });
    }
};
