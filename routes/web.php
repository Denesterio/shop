<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/categories/get', [CategoryController::class, 'get']);
Route::get('/', [CategoryController::class, 'welcome'])->name('welcome');
Route::get('/categories/{categoryId}', [CategoryController::class, 'show']);

Route::get('/products/get', [ProductController::class, 'get']);

Route::get('/subcategories/get', [SubcategoryController::class, 'get']);
Route::get('/subcategories/{subcategorySlug}', [SubcategoryController::class, 'show']);

Route::get('/authors/get', [AuthorController::class, 'get']);

Route::prefix('admin')->middleware('admin')->group(function() {
    Route::get('/categories', [CategoryController::class, 'list'])->name('categories');
    Route::post('/categories/create', [CategoryController::class, 'create']);
    Route::delete('/categories/delete', [CategoryController::class, 'delete']);

    Route::get('/products', [ProductController::class, 'list'])->name('products');
    Route::post('/products/create', [ProductController::class, 'create']);
    Route::delete('/products/delete', [ProductController::class, 'delete'])->name('product.delete');

    Route::post('/subcategories/create', [SubcategoryController::class, 'create']);
    Route::delete('/subcategories/delete', [SubcategoryController::class, 'delete']);
    Route::get('/subcategories', [SubcategoryController::class, 'list'])->name('subcategories');

    Route::post('/authors/create', [AuthorController::class, 'create']);
    Route::delete('/authors/delete', [AuthorController::class, 'delete']);
});

Route::prefix('order')->middleware('auth')->group(function() {
    Route::get('get', [OrderController::class, 'get']);
    Route::post('addProduct', [OrderController::class, 'addProduct']);
    Route::post('deleteProduct', [OrderController::class, 'deleteProduct']);
});

Route::middleware('auth')->group(function() {
    Route::get('/cart', [OrderController::class, 'showCart'])->name('cart');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
