<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Author;
use App\Models\AuthorsProduct;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $data = collect();
        if ($request['type'] === 'product') {
            $data = Product::where('title', 'LIKE', "%{$request['query']}%")
                ->with('authors', 'cover')
                ->paginate($request['limit']);
        } elseif ($request['type'] === 'author') {
            $authorsIds = Author::select('id')->where('title', 'LIKE', "%{$request['query']}%")->get();
            $productsIds = AuthorsProduct::select('product_id')->whereIn('author_id', $authorsIds)->get();
            $data = Product::whereIn('id', $productsIds)->with('authors', 'cover')->paginate($request['limit']);
        }
        return $data;
    }

    public function preview(Request $request)
    {
        if ($request['type'] === 'product') {
            return Product::search($request['query'])->paginate($request['limit']);
        }
        if ($request['type'] === 'author') {
            return Author::search($request['query'])->paginate($request['limit']);
        }
    }
}
