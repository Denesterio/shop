<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('categories')->insert([
            'title' => 'Books',
            'description' => 'Good books'
        ]);
        DB::table('categories')->insert([
            'title' => 'Comics',
            'description' => 'Good comics books',
        ]);
    }
}
