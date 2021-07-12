<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ConfirmOrderController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\ProfileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
    Route::post('/logout', [LoginController::class, 'logout']);
    Route::post('/register', [RegisterController::class, 'create']);

    Route::middleware('auth:sanctum')->get('/getUser', function (Request $request) {
        return $request->user();
    });
});

Route::prefix('categories')->group(function () {
    Route::get('/get', [CategoryController::class, 'get']);
    Route::get('/{categoryId}/products', [ProductController::class, 'showProductsBy'])
        ->name('categoryProducts');
});

Route::prefix('products')->group(function () {
    Route::get('/get', [ProductController::class, 'get']);
    Route::get('/carousel', [ProductController::class, 'carousel'])->name('carousel');
});

Route::prefix('subcategories')->group(function () {
    Route::get('/get', [SubcategoryController::class, 'get']);
    Route::get('/{subcategorySlug}/products', [ProductController::class, 'showProductsBy'])
        ->name('subcategoryProducts');
});

Route::prefix('authors')->group(function () {
    Route::get('/get', [AuthorController::class, 'get']);
    Route::get('/{authorId}/products', [ProductController::class, 'showProductsBy'])
        ->name('authorProducts');
});

Route::get('/tags/get', [TagController::class, 'get']);

Route::prefix('admin')->middleware('admin')->group(function () {
    Route::get('/categories', [CategoryController::class, 'list'])->name('categories');
    Route::post('/categories/create', [CategoryController::class, 'create']);
    Route::delete('/categories/delete', [CategoryController::class, 'delete']);

    Route::get('/products', [ProductController::class, 'list'])->name('products');
    Route::post('/products/create', [ProductController::class, 'create']);
    Route::delete('/products/delete', [ProductController::class, 'delete'])->name('product.delete');

    Route::post('/subcategories/create', [SubcategoryController::class, 'create']);
    Route::delete('/subcategories/delete', [SubcategoryController::class, 'delete']);
    Route::get('/subcategories', [SubcategoryController::class, 'list'])->name('subcategories');

    Route::get('/authors', [AuthorController::class, 'list'])->name('authors');
    Route::post('/authors/create', [AuthorController::class, 'create']);
    Route::delete('/authors/delete', [AuthorController::class, 'delete']);

    Route::post('/tags/create', [TagController::class, 'create']);
    Route::delete('/tags/delete', [TagController::class, 'delete']);
    Route::get('/tags', [TagController::class, 'list'])->name('tags');
});

Route::prefix('order')->middleware('auth')->group(function () {
    Route::get('get', [OrderController::class, 'get']);
    Route::post('addProduct', [OrderController::class, 'addProduct']);
    Route::post('deleteProduct', [OrderController::class, 'deleteProduct']);
    Route::get('confirm', [ConfirmOrderController::class, 'confirm']);
    Route::get('{orderId}/products', [OrderController::class, 'products']);
    Route::get('/cart', [OrderController::class, 'showCart'])->name('cart');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'show'])->name('profile');
    Route::post('/user/edit', [UserController::class, 'edit'])->name('user.edit');
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
