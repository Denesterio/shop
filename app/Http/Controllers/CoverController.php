<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cover;
use App\Http\Requests\StoreCoverRequest;

class CoverController extends Controller
{
    public function store(StoreCoverRequest $request)
    {
        return Cover::create($request->validated());
    }

    public function update(StoreCoverRequest $request, Cover $cover)
    {
        $validated = $request->validated();
        $cover->title = $validated['title'];
        $cover->save();
        return $cover;
    }

    public function index(Request $request)
    {
        if ($request['_limit']) {
            return Cover::OrderBy('id', 'desc')->paginate($request['_limit']);
        }

        return ['data' => Cover::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Cover $cover)
    {
        $cover->delete();
    }
}
