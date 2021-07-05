<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Subcategory;
use App\Models\Author;
use App\Models\Tag;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;

class ProductController extends Controller
{
    public function list ()
    {
        $authors = Author::get();
        $categories = Category::get();
        $subcategories = Subcategory::get();
        $tags = Tag::get();

        return view('admin/products', [
            'authors' => $authors,
            'categories' => $categories,
            'tags' => $tags,
            'subcategories' => $subcategories,
        ]);
    }

    public function get ()
    {
        return Product::get();
    }

    public function create (Request $request)
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
            $filename = $request->file('picture')->store('img', 'public');
        }

        $productId = Product::create([
            'title' => $name,
            'subcategory_slug' => $subcategorySlug,
            'picture' => $filename,
            'price' => $price,
            'description' => $description,
        ])->id;


        foreach (json_decode($tags) as $tagId) {
            TagsProduct::create([
                'tag_id' => $tagId,
                'product_id' => $productId,
            ]);
        };

        foreach (json_decode($authors) as $authorId) {
            AuthorsProduct::create([
                'product_id' => $productId,
                'author_id' => $authorId,
            ]);
        };
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
        $products = Product::with('authors')
            ->orderBy('created_at', 'desc')
            ->limit(10)
            ->get();

        $authors = collect();
        $products->each(function ($item) use ($authors) {
            $key = $item->id;
            $authors[$key] = $item->authors()->get();
        });

        return ['products' => $products, 'authors' => $authors];
    }
}
