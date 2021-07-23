<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function get()
    {
        return Product::get();
    }

    public function create(Request $request)
    {
        [
            'name' => $name,
            'subcategorySlug' => $subcategorySlug,
            'description' => $description,
            'price' => $price,
            'productAuthors' => $authors,
            'tags' => $tags,
        ] = $request;

        $filename = '';
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            $filename = time() . $file->getClientOriginalName();
            $request->file('picture')->storeAs('public/img', $filename);
        }

        $product = Product::create([
            'title' => $name,
            'subcategory_slug' => $subcategorySlug,
            'picture' => $filename,
            'price' => $price,
            'description' => $description,
        ]);


        foreach (json_decode($tags) as $tagId) {
            TagsProduct::create([
                'tag_id' => $tagId,
                'product_id' => $product->id,
            ]);
        };

        foreach (json_decode($authors) as $authorId) {
            AuthorsProduct::create([
                'product_id' => $product->id,
                'author_id' => $authorId,
            ]);
        };

        return $product;
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        TagsProduct::where('product_id', $id)->delete();
        AuthorsProduct::where('product_id', $id)->delete();
        Product::find($id)->delete();
    }

    public static function carousel()
    {
        // DB::listen(function ($query) {
        //     var_dump($query->sql, $query->bindings);
        // });
        $products = Product::with('authors')
            ->orderBy('created_at', 'desc')
            ->limit(10)
            ->get();

        return $products;
    }
}
