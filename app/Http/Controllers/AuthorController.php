<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;
use App\Models\Category;
use App\Models\Subcategory;
use App\Models\Order;
use App\Models\OrdersProduct;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class AuthorController extends Controller
{
    public function create(Request $request)
    {
        $author = Author::create([
            'title' => $request['name'],
        ]);

        return $author;
    }

    public function get()
    {
        return Author::get();
    }

    public function delete(Request $request)
    {
        $id = $request['id'];
        Author::find($id)->delete();
    }

    public function list ()
    {
        $authors = Author::orderBy('id', 'desc')->get();
        return view('admin/authors', [
            'authors' => $authors,
            'title' => 'Добавить автора'
            ]);
    }

    public function show ($autorId)
    {
        // DB::listen(function($query) {
        //     var_dump($query->sql, $query->bindings, "...  ||  ...");
        // });

        $author = Author::where('id', $autorId)->first();

        $products = $author->products()->get();

        $authors = collect();

        $products->each(function ($item) use ($authors) {
            $key = $item->id;
            $authors[$key] = $item->authors()->get();
        });

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

        $tags = DB::table('tags')
            ->select('tags.title', 'tp.product_id')
            ->join('tags_products as tp', 'tags.id', '=', 'tp.tag_id')
            ->get();

        return view('categoryProducts', [
            'products' => $products,
            'categories' => $categories,
            'subcategories' => $subcategories,
            'orderProducts' => $orderProducts,
            'tags' => $tags,
            'authors' => $authors,
        ]);
    }
}
