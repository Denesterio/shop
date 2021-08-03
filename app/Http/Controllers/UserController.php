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
        $id = Auth::user()->id;
        $user = User::find($id)->first();

        if ($field === 'name') {
            $validated = $request->validate([
                'name' => ['required', 'string', 'max:255', 'unique:users,name'],
            ]);
        } else if ($field === 'email') {
            $validated = $request->validate([
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
            ]);
        }
        $user->$field = $validated[$field];
        $user->save();

        return $user;
    }
}
