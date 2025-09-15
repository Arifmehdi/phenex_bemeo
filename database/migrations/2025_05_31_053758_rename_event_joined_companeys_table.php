<?php

namespace Database\Migrations;

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::rename('event_joined_companeys', 'event_joined_companies');
    }

    public function down()
    {
        Schema::rename('event_joined_companies', 'event_joined_companeys');
    }
};
