<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Order;
use App\Mail\ConfirmOrderMailer;
use stdClass;
use Illuminate\Support\Facades\Mail;

class ConfirmOrderController extends Controller
{
    public function confirm (Request $request)
    {
        $user = Auth::user();
        $order = Order::where('user_id', $user->id)->where('status', 0)->first();
        $orderProducts = DB::table('orders_products as op')
        ->select(
            'op.id',
            'op.quantity',
            'op.product_id',
            'p.title',
            'p.price',
            'p.picture'
        )
        ->join('products as p', 'p.id', 'op.product_id')
        ->where('op.order_id', $order->id)
        ->get();

        $sum = $orderProducts->map(function($orderProduct) {
            return $orderProduct->quantity * $orderProduct->price;
        })->sum();

        $data = new stdClass();
        $data->products = $orderProducts;
        $data->sum = $sum;

        Mail::to('mrdnsong@gmail.com')->send(new ConfirmOrderMailer($data));

        $order->status = 1;
        $order->save();

        return redirect()->back()->with('success', 'Заказ оформлен');
    }
}
