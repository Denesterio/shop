<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cover;
use App\Http\Requests\StoreCoverRequest;

class CoverController extends Controller
{
    public function create(StoreCoverRequest $request)
    {
        return Cover::create($request->validated());
    }

    public function get()
    {
        return Cover::OrderBy('id', 'desc')->paginate(20);
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Cover::find($id)->delete();
    }
}
