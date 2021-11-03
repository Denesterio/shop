<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CoverSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('covers')->insert([
            'title' => 'Твердая',
        ]);
        DB::table('covers')->insert([
            'title' => 'Мягкая',
        ]);
    }
}
