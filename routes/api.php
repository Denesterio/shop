<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\CoverController;
use App\Http\Controllers\ProductReviewController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\SearchController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('auth')->group(function () {
    Route::post('/login', [LoginController::class, 'login']);
    Route::get('/logout', [LoginController::class, 'logout']);
    Route::post('/register', [RegisterController::class, 'register']);

    Route::middleware('auth:sanctum')->get('/getUser', function (Request $request) {
        return $request->user();
    });
});

Route::prefix('categories')->group(function () {
    Route::get('/menu', [CategoryController::class, 'menu'])->name('menu');
});
Route::apiResource('categories', CategoryController::class)->only(['index', 'show']);

Route::apiResource('products.reviews', ProductReviewController::class)->only(['index', 'store']);
Route::apiResource('products', ProductController::class)->only(['index', 'show']);
Route::prefix('products')->group(function () {
    Route::get('/{productId}/ratings', [RatingController::class, 'index']);
    Route::post('/{productId}/ratings', [RatingController::class, 'store']);
});

Route::apiResource('subcategories', SubcategoryController::class)->only(['index', 'show']);
Route::apiResource('authors', AuthorController::class)->only(['index', 'show']);
Route::apiResource('tags', TagController::class)->only(['index', 'show']);
Route::apiResource('covers', CoverController::class)->only(['index']);

Route::prefix('admin')->middleware('admin')->group(function () {
    Route::apiResource('categories', CategoryController::class)->only(['store', 'update', 'destroy']);
    Route::apiResource('products', ProductController::class)->only(['store', 'update', 'destroy']);
    Route::apiResource('subcategories', SubcategoryController::class)->only(['store', 'update', 'destroy']);
    Route::apiResource('authors', AuthorController::class)->only(['store', 'update', 'destroy']);
    Route::apiResource('tags', TagController::class)->only(['store', 'update', 'destroy']);
    Route::apiResource('covers', CoverController::class)->only(['store', 'update', 'destroy']);
});

Route::middleware('auth')->group(function () {
    Route::post('/user/edit', [UserController::class, 'edit'])->name('user.edit');

    Route::prefix('orders')->group(function () {
        Route::get('/', [OrderController::class, 'index']);
        Route::put('addProduct', [OrderController::class, 'addProduct']);
        Route::put('deleteProduct', [OrderController::class, 'deleteProduct']);
        Route::get('confirm', [OrderController::class, 'confirm']);
        Route::get('{orderId}/products', [OrderController::class, 'products']);
        Route::get('/cart', [OrderController::class, 'showCart'])->name('cart');
    });
});

Route::get('/search', [SearchController::class, 'search'])->name('search');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
