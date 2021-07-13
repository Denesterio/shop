<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class UserController extends Controller
{
    public function edit(Request $request)
    {
        $field = $request->field;
        $userId = Auth::user()->id;
        $user = User::where('id', $userId)->first();

        if ($field === 'name') {
            $validated = $request->validate([
                'name' => 'required',
            ]);
            $user->name = $validated['name'];
        } else if ($field === 'email') {
            $validated = $request->validate([
                'email' => ['required', 'email']
            ]);
            $user->email = $validated['email'];
        }

        $user->save();

        return $user;
    }
}
