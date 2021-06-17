<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function list ()
    {
        $categories = Category::get();
        return view('categories', [
            'categories' => $categories,
            'title' => 'Категории'
            ]);
    }

    public function create(Request $request)
    {
        sleep(1);
        Category::create([
            'title' => $request['name'],
            'description' => $request['desc']
        ]);
    }

    public function get()
    {
        sleep(1);
        return Category::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Category::find($id)->delete();
    }
}
