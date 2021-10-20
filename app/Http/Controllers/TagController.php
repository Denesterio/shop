<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tag;
use App\Http\Requests\StoreTagRequest;

class TagController extends Controller
{
    public function create(StoreTagRequest $request)
    {
        return Tag::create($request->validated());
    }

    public function get()
    {
        return Tag::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Tag::find($id)->delete();
    }

    public function showProducts($id)
    {
        $tag = Tag::where('id', $id)->first();
        $products = $tag->products()->with('authors')->get();

        return $products;
    }
}
