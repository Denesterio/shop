<?php

namespace App\Http\Controllers;

use App\Models\ProductReview;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreProductReviewRequest;
use App\Events\ReviewCreated;

class ProductReviewController extends Controller
{
    public function store(StoreProductReviewRequest $request)
    {
        $validated = $request->validated();

        $review = ProductReview::create([
            'body' => $validated['review'],
            'product_id' => $validated['product_id'],
            'user_id' => Auth::id(),
        ]);

        event(new ReviewCreated($review));
    }

    public function index(Product $product)
    {
        return $product->reviews()->with('user')->get();
    }
}
