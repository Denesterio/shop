<?php

namespace App\Http\Controllers;

use App\Models\Subcategory;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubcategoryController extends Controller
{
    public function list ()
    {
        $subcategories = Subcategory::get();
        return view('subcategories', [
            'subcategories' => $subcategories,
            'title' => 'Подкатегории'
            ]);
    }

    public function show ($subcategorySlug)
    {        
        $products = DB::table('products')
            ->where('subcategory_slug', '=', $subcategorySlug)
            ->get();
        $categories = Category::get();
        $subcategories = Subcategory::get();

        return view('categoryProducts', [
            'products' => $products,
            'categories' => $categories,
            'subcategories' => $subcategories
        ]);
    }

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
}
