<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $data = Product::search($request['query'])
            ->paginate($request['limit']);
        return $data;
    }
}
