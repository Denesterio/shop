<?php

namespace App\Http\Controllers;

use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Models\Product;

class SubcategoryController extends Controller
{
    public function create(Request $request)
    {
        Subcategory::create([
            'title' => $request['name'],
            'category_id' => $request['categoryId'],
            'slug' => $request['slug'],
        ]);
    }

    public function get()
    {
        return Subcategory::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Subcategory::find($id)->delete();
    }

    public function showProducts($id)
    {
        $products = Product::with('authors')
            ->where('subcategory_slug', '=', $id)
            ->get();
        $authors = collect();

        $products->each(function ($item) use ($authors) {
            $id = $item->id;
            $authors[$id] = $item->authors;
        });

        return [
            'products' => $products,
            'authors' => $authors,
        ];
    }
}
