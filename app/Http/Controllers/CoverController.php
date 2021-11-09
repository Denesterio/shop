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
        if ($request->has('limit')) {
            $total = Cover::count();
            $skipped = ($request['page'] - 1) * $request['limit'];
            $data = Cover::OrderBy('id', 'desc')
                ->skip($skipped)
                ->take($request['limit'])
                ->get();
            return compact('data', 'total');
        }

        return ['data' => Cover::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Cover $cover)
    {
        $cover->delete();
    }
}
