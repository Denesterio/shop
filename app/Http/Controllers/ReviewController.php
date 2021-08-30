<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function create(Request $request)
    {
        $request->validate([
            'review' => ['required', 'string'],
            'product_id' => ['required', 'integer'],
        ]);
        $user = Auth::user();

        $review = Review::create([
            'body' => $request['review'],
            'product_id' => $request['product_id'],
            'user_id' => $user->id,
        ]);

        $review['user'] = Auth::user();

        return $review;
    }
}
