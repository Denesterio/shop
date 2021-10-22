<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;
use App\Http\Requests\StoreAuthorRequest;

class AuthorController extends Controller
{
    public function create(StoreAuthorRequest $request)
    {
        return Author::create($request->validated());
    }

    public function get()
    {
        return Author::OrderBy('id', 'desc')->paginate(20);
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Author::find($id)->delete();
    }

    public function showProducts($id)
    {
        $author = Author::where('id', $id)->first();
        $products = $author->products()->with('authors')->get();

        return $products;
    }
}
