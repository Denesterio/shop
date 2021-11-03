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
            'title' => 'Книги по программированию',
            'description' => 'Большой набор книг, посвященных программированию, помогут научиться сложной профессии.'
        ]);
        DB::table('categories')->insert([
            'title' => 'Комиксы',
            'description' => 'Увлекательные истории, которые помогут ненадолго отвлечься от тяжелой работы.',
        ]);
        DB::table('categories')->insert([
            'title' => 'Комиксы по программированию',
            'description' => 'Дают возможность изучать новое в увлекательной форме.'
        ]);
        DB::table('categories')->insert([
            'title' => 'Книги комиксов',
            'description' => 'А, может, ну его, это программирование!',
        ]);
    }
}
