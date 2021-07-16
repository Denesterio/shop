<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tag;

class TagController extends Controller
{
    public function create(Request $request)
    {
        $tag = Tag::create([
            'title' => $request['name'],
        ]);

        return $tag;
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
}
