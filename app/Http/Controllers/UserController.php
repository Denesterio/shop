<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class UserController extends Controller
{
    public function edit(Request $request)
    {
        $userId = Auth::user()->id;
        $name = $request->name;
        $user = User::where('user_id', $userId);

        $user->name = $name;

        $user->save();

        return ['user' => $user];
    }
}
