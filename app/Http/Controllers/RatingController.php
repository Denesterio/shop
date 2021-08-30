<?php

namespace App\Http\Controllers;

use App\Models\Rating;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

function generateId()
{
    $chars = 'abcdefghijklmnopqrstuvwxyz';
    $key = substr(str_shuffle($chars), 0, 10) . time();
    return $key;
}

class RatingController extends Controller
{
    public function create(Request $request)
    {
        $userId = $this->getUserId($request);
        if (!$userId) {
            $userId = generateId();
        }

        $rating = Rating::where('user_id', $userId)
            ->where('product_id', $request['product_id'])
            ->first();

        if ($rating) {
            return 'Вы уже оценили эту книгу';
        }
        $rating = Rating::create([
            'product_id' => $request['product_id'],
            'user_id' => $userId,
            'rating' => $request['rating'],
        ]);

        if (!$this->getUserId($request)) {
            $response = new Response('created');
            return  $response->withCookie(cookie()->forever('idKey', $userId));
        }
    }

    private function getUserId(Request $request)
    {
        return $request->cookie('idKey');
    }

    public function get(Request $request, $id)
    {
        $userId = $this->getUserId($request);
        $ratings = Rating::where('product_id', $id)->get();
        $averageRating = $ratings->map(function ($item) {
            return $item['rating'];
        })->avg();
        if (!$averageRating) {
            $averageRating = 0;
        }
        $votesCount = $ratings->count();
        $isRated = (bool) $ratings->first(function ($item) use ($userId) {
            return $item['user_id'] === $userId;
        });
        return ['rating' => $averageRating, 'votes' => $votesCount, 'isRated' => $isRated];
    }
}
