<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\ProductReview;

class ReviewCreated implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $review;
    public $user;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(ProductReview $review)
    {
        $this->review = $review;
        $this->user = User::find(Auth::id())->toArray();
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new Channel('product-' . $this->review->product_id . '-review');
    }

    public function broadcastAs()
    {
        return 'product.review';
    }
}
