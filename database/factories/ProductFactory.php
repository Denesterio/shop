<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\DB;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    public function configure()
    {
        return $this->afterCreating(function (Product $product) {
            DB::table('authors_products')->insert([
                'author_id' => rand(1, 10),
                'product_id' => $product->id,
            ]);
            DB::table('tags_products')->insert([
                'tag_id' => rand(1, 3),
                'product_id' => $product->id,
            ]);
        });
    }

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(rand(1, 6)),
            'subcategory_slug' => $this->faker->randomElement(array('first', 'second', 'firstOfComics', 'secondOfComics')),
            'picture' => '',
            'pictures' => json_encode([]),
            'description' => $this->faker->text(400),
            'price' => $this->faker->numberBetween(200, 2000),
            'pages' => $this->faker->numberBetween(150, 550),
            'year' => $this->faker->numberBetween(1990, 2020),
            'cover_id' => $this->faker->numberBetween(1, 2),
        ];
    }
}
