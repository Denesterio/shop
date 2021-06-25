<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrdersProduct;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function addProduct (Request $request)
    {
        $user = Auth::user();
        $order = Order::where('user_id', $user->id)->where('status', 0)->first();
        if (!$order) {
            $order = Order::create([
                'user_id' => $user->id
            ]);
        }

        $product = Product::find($request['productId']);

        $ordersProduct = OrdersProduct::where('order_id', $order->id)
            ->where('product_id', $product->id)
            ->first();

        if ($ordersProduct) {
            $ordersProduct->quantity += 1;
            $ordersProduct->save();
        } else {
            $ordersProduct = OrdersProduct::create([
                'order_id' => $order->id,
                'product_id' => $product->id,
                'quantity' => 1,
                'price' => $product->price
            ]);
        }
        return $ordersProduct;
    }

    // public function get (Request $request)
    // {
    //     $user = Auth::user();
    //     $order = Order::where('user_id', $user->id)->where('status', 0)->first();

    //     if (!$order) {
    //         $orders = [];
    //     } else {
    //         $ordersProducts = OrdersProduct::where('order_id', $order->id)->get();
    //         $orders = [
    //             'orders' => $ordersProducts,
    //         ];
    //     }

    //     return $orders;
    // }

    public function deleteProduct (Request $request)
    {
        $productId = $request->productId;
        $orderId = $request->orderId;

        $ordersProduct = OrdersProduct::where('order_id', $orderId)
            ->where('product_id', $productId)
            ->first();

        $ordersProduct->quantity -= 1;
        if ($ordersProduct->quantity === 0) {
            $ordersProduct->delete();
        } else {
            $ordersProduct->save();
        }
    }
}
