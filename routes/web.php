<?php

use Illuminate\Support\Facades\Route;

Route::any('/{any}', function () {
    return view('layouts.app');
})->where('any', '.*');
