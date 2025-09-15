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
        Schema::create('event_member_tokens', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->foreignId('event_member_id')->constrained()->onDelete('cascade')->index();
            $table->foreignId('event_id')->constrained()->onDelete('cascade')->index();
            $table->timestamp('done_at')->nullable(); // changed from string
            $table->boolean('is_done')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('event_member_tokens');
    }
};
