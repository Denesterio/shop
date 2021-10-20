<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('subcategories')->insert([
            'title' => 'first',
            'category_id' => 1,
            'slug' => 'first',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'second',
            'category_id' => 1,
            'slug' => 'second',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'firstOfComics',
            'category_id' => 2,
            'slug' => 'firstOfComics',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'secondOfComics',
            'category_id' => 2,
            'slug' => 'secondOfComics',
        ]);
    }
}
