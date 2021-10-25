<?php

namespace App\Http\Controllers;

use App\Models\ProductReview;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreProductReviewRequest;

class ProductReviewController extends Controller
{
    public function store(StoreProductReviewRequest $request)
    {
        $validated = $request->validated();
        $user = Auth::user();

        $review = ProductReview::create([
            'body' => $validated['review'],
            'product_id' => $validated['product_id'],
            'user_id' => $user->id,
        ]);

        $review['user'] = $user;

        return $review;
    }

    public function index(Product $product)
    {
        return $product->reviews()->with('user')->get();
    }
}
