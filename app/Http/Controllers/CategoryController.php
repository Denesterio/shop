<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use App\Models\Order;
use App\Models\Tag;
use App\Models\OrdersProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    public function welcome ()
    {
        $categories = Category::get();
        $subcategories = Subcategory::get();
        return view('welcome', [
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
    }

    public function show ($categoryId)
    {
        $products = DB::table('subcategories')
            ->select('category_id', 'products.*')
            ->join('products', 'subcategories.slug', '=', 'products.subcategory_slug')
            ->where('category_id', '=', $categoryId)
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

        $tags = Tag::get();

        return view('categoryProducts', [
            'products' => $products,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'orderProducts' => $orderProducts,
            'tags' => $tags,
        ]);
    }

    public function list ()
    {
        $categories = Category::get();
        return view('admin/categories', [
            'categories' => $categories,
            'title' => 'Категории'
            ]);
    }

    public function create(Request $request)
    {
        sleep(1);
        Category::create([
            'title' => $request['name'],
            'description' => $request['desc']
        ]);
    }

    public function get()
    {
        sleep(1);
        return Category::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Category::find($id)->delete();
    }
}
