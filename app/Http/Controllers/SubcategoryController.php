<?php

namespace App\Http\Controllers;

use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Requests\StoreSubcategoryRequest;
use App\Http\Requests\UpdateSubcategoryRequest;

class SubcategoryController extends Controller
{
    public function store(StoreSubcategoryRequest $request)
    {
        $validated = $request->validated();
        return Subcategory::create([
            'title' => $validated['title'],
            'slug' => $validated['slug'],
            'category_id' => $validated['categoryId'],
        ]);
    }

    public function update(UpdateSubcategoryRequest $request, Subcategory $subcategory)
    {
        $validated = $request->validated();
        $subcategory->fill($validated);
        $subcategory->save();
        return $subcategory;
    }

    public function index(Request $request)
    {
        if ($request['_limit']) {
            return Subcategory::OrderBy('id', 'desc')->paginate($request['_limit']);
        }

        return ['data' => Subcategory::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Subcategory $subcategory)
    {
        $subcategory->delete();
    }

    public function show($id)
    {
        $products = Product::with('authors')
            ->where('subcategory_slug', '=', $id)
            ->get();

        return $products;
    }
}
