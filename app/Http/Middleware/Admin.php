<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */

    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();
        if (!$user || !$user->admin) {
            return response()->json(['status' => 403, 'message' => 'Действие доступно только для администраторов'], 403);
        }

        return $next($request);
    }
}
