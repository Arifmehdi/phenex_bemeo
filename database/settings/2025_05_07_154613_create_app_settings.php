<?php

use Spatie\LaravelSettings\Migrations\SettingsBlueprint;
use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->inGroup('app', function (SettingsBlueprint $blueprint): void {
            $blueprint->add('limited_company_fee', 10000);
            $blueprint->add('proprietorship_fee', 5000);
            $blueprint->add('foreign_joint_venture_fee', 20000);

            $blueprint->add('machine_fee_1_to_4', 2000);
            $blueprint->add('machine_fee_5_to_9', 5000);
            $blueprint->add('machine_fee_10_plus', 10000);
        });
    }
};
