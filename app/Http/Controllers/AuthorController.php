<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;

class AuthorController extends Controller
{
    public function create(Request $request)
    {
        Author::create([
            'title' => $request['name'],
        ]);
    }

    public function get()
    {
        return Author::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Author::find($id)->delete();
    }
}
