<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cover;

class CoverController extends Controller
{
    public function create(Request $request)
    {
        $request->validate([
            'title' => ['required', 'string', 'max:255', 'unique:covers'],
        ]);

        $cover = Cover::create([
            'title' => $request['title'],
        ]);

        return $cover;
    }

    public function get()
    {
        return Cover::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Cover::find($id)->delete();
    }
}
