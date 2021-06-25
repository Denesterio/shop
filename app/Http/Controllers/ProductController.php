<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    public function list ()
    {
        return view('productsForAdmin');
    }

    public function get ()
    {
        return Product::get();
    }

    public function create (Request $request)
    {
        $name = $request['name'];
        $subcategorySlug = $request['subcategorySlug'];
        $price = $request['price'];
        $description = $request['description'];
        $authorId = $request['authorId'];
        $filename = '';
        if ($request->hasFile('picture')) {
            $filename = $request->file('picture')->store('img', 'public');
        }

        Product::create([
            'title' => $name,
            'subcategory_slug' => $subcategorySlug,
            'picture' => $filename,
            'price' => $price,
            'description' => $description,
            'author_id' => $authorId,
        ]);
    }
    public function delete(Request $request)
    {
        $id = $request['id'];
        Product::find($id)->delete();
    }
}
