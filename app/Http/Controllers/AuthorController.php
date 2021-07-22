<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;

class AuthorController extends Controller
{
    public function create(Request $request)
    {
        $request->validate([
            'title' => ['required', 'string', 'max:255', 'unique:authors'],
        ]);
        $author = Author::create([
            'title' => $request['title'],
        ]);

        return $author;
    }

    public function get()
    {
        return Author::OrderBy('id', 'desc')->get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Author::find($id)->delete();
    }

    public function showProducts($id)
    {
        $author = Author::where('id', $id)->first();
        $products = $author->products()->get();
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
