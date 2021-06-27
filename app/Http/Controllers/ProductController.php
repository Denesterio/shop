<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\AuthorsProduct;
use App\Models\TagsProduct;

class ProductController extends Controller
{
    public function list ()
    {
        return view('admin/products');
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
}
