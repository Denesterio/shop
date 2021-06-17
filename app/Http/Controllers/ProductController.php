<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function list ()
    {
        return view('products');
    }

    public function get ()
    {
        return Product::get();
    }

    public function create (Request $request)
    {
        $name = $request['name'];
        $categoryId = $request['categoryId'];
        if ($request->hasFile('picture')) {
            $file = $request->file('picture')->store('img', 'public');
            $filename = time() . $file;
        } else {
            $filename = '';
        }
        
        Product::create([
            'title' => $name,
            'category_id' => $categoryId,
            'picture' => $filename
        ]);
    }
    public function delete(Request $request)
    {
        $id = $request['id'];
        Product::find($id)->delete();
    }
}
