<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;
use App\Http\Requests\StoreAuthorRequest;

class AuthorController extends Controller
{
    public function store(StoreAuthorRequest $request)
    {
        return Author::create($request->validated());
    }

    public function update(StoreAuthorRequest $request, Author $author)
    {
        $validated = $request->validated();
        $author->title = $validated['title'];
        $author->save();
        return $author;
    }

    public function index(Request $request)
    {
        if ($request['_limit']) {
            return Author::OrderBy('id', 'desc')->paginate($request['_limit']);
        }

        return ['data' => Author::OrderBy('id', 'desc')->get()];
    }

    // public function get()
    // {
    //     return Author::OrderBy('id', 'desc')->paginate(20);
    // }

    public function destroy(Author $author)
    {
        $author->delete();
    }

    public function show(Request $request, Author $author)
    {
        $total = $author->products->count();

        $limit = (int) $request['_limit'];
        $skipped = ((int) $request['_page'] - 1) * $limit;
        $products = $author
            ->products()
            ->with('authors')
            ->latest()
            ->skip($skipped)
            ->take($limit)
            ->get();

        return compact('products', 'total');
    }
}
