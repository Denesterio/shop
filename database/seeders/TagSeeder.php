<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tags')->insert([
            'title' => 'tag1',
        ]);
        DB::table('tags')->insert([
            'title' => 'tag2',
        ]);
        DB::table('tags')->insert([
            'title' => 'tag3',
        ]);
    }
}
