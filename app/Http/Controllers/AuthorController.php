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
        if ($request->has('limit')) {
            $total = Author::count();
            $skipped = ((int) $request['page'] - 1) * (int) $request['limit'];
            $data = Author::OrderBy('id', 'desc')
                ->skip($skipped)
                ->take($request['limit'])
                ->get();
            return compact('data', 'total');
        }

        return ['data' => Author::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Author $author)
    {
        $author->delete();
    }

    public function show(Request $request, Author $author)
    {
        $total = $author->products->count();

        $limit = (int) $request['limit'];
        $skipped = ((int) $request['page'] - 1) * $limit;
        $data = $author
            ->products()
            ->with('authors', 'cover')
            ->latest()
            ->skip($skipped)
            ->take($limit)
            ->get();

        return compact('data', 'total');
    }
}
