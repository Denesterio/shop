<?php

namespace App\Http\Controllers;

use App\Models\Subcategory;
use App\Models\Category;
use App\Models\Order;
use App\Models\Tag;
use App\Models\Product;
use App\Models\OrdersProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class SubcategoryController extends Controller
{
    public function list ()
    {
        $subcategories = Subcategory::get();
        $categories = Category::get();

        return view('admin/subcategories', [
            'subcategories' => $subcategories,
            'categories' => $categories,
            'title' => 'Подкатегории'
            ]);
    }

    public function show ($subcategorySlug)
    {
        $products = Product::with('authors')
            ->where('subcategory_slug', '=', $subcategorySlug)
            ->get();

        $categories = Category::get();
        $subcategories = Subcategory::get();

        $user = Auth::user();
        if ($user) {
            $order = Order::where('user_id', $user->id)
            ->where('status', 0)
            ->first();
        }

        $orderProducts = collect();
        if (isset($order)) {
            $orderProducts = OrdersProduct::where('order_id', $order->id)->get();
        }

        $authors = collect();

        $products->each(function($item) use ($authors) {
            $id = $item->id;
            $authors[$id] = $item->authors;
        });

        return view('categoryProducts', [
            'products' => $products,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'orderProducts' => $orderProducts,
            'authors' => $authors,
        ]);
    }

    public function create(Request $request)
    {
        Subcategory::create([
            'title' => $request['name'],
            'category_id' => $request['categoryId'],
            'slug' => $request['slug'],
        ]);
    }

    public function get()
    {
        return Subcategory::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Subcategory::find($id)->delete();
    }
}
