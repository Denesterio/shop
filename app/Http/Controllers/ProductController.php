<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function get()
    {
        return Product::get();
    }

    public function getProduct($id)
    {
        $book = Product::find($id)->first();
        return $book;
    }

    public function create(Request $request)
    {
        [
            'title' => $title,
            'subcategorySlug' => $subcategorySlug,
            'description' => $description,
            'price' => $price,
            'productAuthors' => $authors,
            'tags' => $tags,
        ] = $request;

        $authors = json_decode($authors);
        $tags = json_decode($tags);

        $request->validate([
            'title' => ['required', 'string', 'max:255', 'unique:products,title'],
            'subcategorySlug' => ['required', 'string', 'max:255', 'exists:subcategories,slug'],
            'description' => ['required', 'string'],
            'price' => ['required', 'integer'],
            'productAuthors' => ['required', 'json'],
            'tags' => ['required', 'json'],
        ]);

        Validator::make(['authors' => $authors, 'tags' => $tags], [
            'authors' => ['required', 'array'],
            'authors.*' => ['required', 'distinct'],
            'tags' => ['required', 'array'],
            'tags.*' => ['required', 'distinct'],
        ])->validate();

        $filename = '';
        if ($request->hasFile('picture')) {
            $file = $request->file('picture');
            $filename = time() . $file->getClientOriginalName();
            $request->file('picture')->storeAs('public/img', $filename);
        }

        $product = Product::create([
            'title' => $title,
            'subcategory_slug' => $subcategorySlug,
            'picture' => $filename,
            'price' => $price,
            'description' => $description,
        ]);


        foreach ($tags as $tagId) {
            TagsProduct::create([
                'tag_id' => $tagId,
                'product_id' => $product->id,
            ]);
        };

        foreach ($authors as $authorId) {
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
