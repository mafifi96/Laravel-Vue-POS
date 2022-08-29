<?php

namespace App\Http\Controllers\Api;

use App\Events\OrderConfirmed;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\User;


class OrderController extends Controller
{
    public function confirm()
    {

        $products = Cart::where('user_id', Auth::id())->get();

        if ($products->count() <= 0) {
            return response()->json(['message'=>'cant confirm order', 'status'=> false],500);
        }
        $user = Auth::id();

            DB::transaction(function () use ($products , $user) {

            $total_price = $products->sum('price');

            $data = [];

            $items = $products->flatten()->pluck('quantity', 'product_id')->map(function ($value, $key) use ($data) {

                return $data[$key] = ['quantity' => $value];

            })->toArray();

            $order = Order::Create([
                'status' => "shipping",
                'total_price' => $total_price,
                'user_id' => $user,

            ]);

            $order->products()->attach($items);

            Cart::where("user_id", $user)->delete();

            //event(new OrderConfirmed($order));

        });


        return response()->json(['message' => 'order confirmed' , 'status' => true],200);
    }
    public function orders()
    {
        $orders = Order::latest()->get();

        $orders->load("user");

        return response()->json(['orders' => $orders]);
    }
    public function order(Order $order){

        return response()->json(['order' => $order->load(['user','products'])]);

    }

    public function customerOrders()
    {

        $orders = auth()->user()->orders;

        $orders->load("products");

        return response()->json(['orders' => $orders, 'total_price' => $orders->sum('total_price')],200);

    }

    public function updateStatus(Request $request , Order $order){

        //return dd($request->only('status'));

        $order->update($request->only('status'));

        return response(200);

    }


}
