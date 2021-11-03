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
            'title' => 'Веб',
            'category_id' => 1,
            'slug' => 'web',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'Архитектура',
            'category_id' => 1,
            'slug' => 'architecture',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'Марвел',
            'category_id' => 2,
            'slug' => 'marvel',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'DC Comics',
            'category_id' => 2,
            'slug' => 'dccomics',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'Для детей',
            'category_id' => 3,
            'slug' => 'dlyadetei',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'Манга',
            'category_id' => 4,
            'slug' => 'manga',
        ]);
        DB::table('subcategories')->insert([
            'title' => 'Европейские комиксы',
            'category_id' => 4,
            'slug' => 'europe',
        ]);
    }
}
