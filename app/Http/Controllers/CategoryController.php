<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function menu()
    {
        $categories = Category::get();
        $subcategories = Subcategory::get();
        return [
            'categories' => $categories,
            'subcategories' => $subcategories,
        ];
    }

    public function create(Request $request)
    {
        $cat = Category::create([
            'title' => $request['name'],
            'description' => $request['desc']
        ]);

        return $cat;
    }

    public function get()
    {
        return Category::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Category::find($id)->delete();
    }

    public function showProducts($id)
    {
        $products = Category::find($id)->products()->get();
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
