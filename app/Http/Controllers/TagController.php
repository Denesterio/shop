<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tag;
use App\Http\Requests\StoreTagRequest;

class TagController extends Controller
{
    public function store(StoreTagRequest $request)
    {
        return Tag::create($request->validated());
    }

    public function update(StoreTagRequest $request, Tag $tag)
    {
        $validated = $request->validated();
        $tag->title = $validated['title'];
        $tag->save();
        return $tag;
    }

    public function index(Request $request)
    {
        if ($request->has('limit')) {
            $total = Tag::count();
            $skipped = ($request['page'] - 1) * $request['limit'];
            $data = Tag::OrderBy('id', 'desc')
                ->skip($skipped)
                ->take($request['limit'])
                ->get();
            return compact('data', 'total');
        }

        return ['data' => Tag::OrderBy('id', 'desc')->get()];
    }

    public function destroy(Tag $tag)
    {
        $tag->delete();
    }

    public function show(Request $request, Tag $tag)
    {
        $total = $tag->products->count();
        $limit = (int) $request['limit'];
        $skipped = ((int) $request['page'] - 1) * $limit;
        $data = $tag
            ->products()
            ->with('authors')
            ->latest()
            ->skip($skipped)
            ->take($limit)
            ->get();;

        return compact('data', 'total');
    }
}
