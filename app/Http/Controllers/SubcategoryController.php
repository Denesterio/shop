<?php

namespace App\Http\Controllers;

use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Requests\StoreSubcategoryRequest;

class SubcategoryController extends Controller
{
    public function create(StoreSubcategoryRequest $request)
    {
        $validated = $request->validated();
        return Subcategory::create([
            'title' => $validated['title'],
            'slug' => $validated['slug'],
            'category_id' => $validated['categoryId'],
        ]);
    }

    public function get()
    {
        return Subcategory::OrderBy('id', 'desc')->paginate(20);
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

        return $products;
    }
}
