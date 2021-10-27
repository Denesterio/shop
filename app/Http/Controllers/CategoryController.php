<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Http\Requests\StoreCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;

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

    public function store(StoreCategoryRequest $request)
    {
        return Category::create($request->validated());
    }

    public function update(UpdateCategoryRequest $request, Category $category)
    {
        $validated = $request->validated();
        $category->fill($validated);
        $category->save();
        return $category;
    }

    public function index(Request $request)
    {
        if ($request['_limit']) {
            return Category::OrderBy('id', 'desc')->paginate($request['_limit']);
        }

        return ['data' => Category::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Category $category)
    {
        $category->delete();
    }

    public function show(Request $request, Category $category)
    {
        $total = $category->products->count();
        $limit = (int) $request['_limit'];
        $skipped = ((int) $request['_page'] - 1) * $limit;
        return ['total' => $total, 'products' => $category
            ->products()
            ->with('authors')
            ->latest()
            ->skip($skipped)
            ->take($limit)
            ->get()];
    }
}
