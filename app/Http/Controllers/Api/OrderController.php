<?php

namespace App\Http\Controllers\Api;

use App\Events\OrderConfirmed;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\User;


class OrderController extends Controller
{
    public function confirm(Request $request)
    {

        $products = collect($request->all()[0]);

        $user = $request->all()[1];

        DB::transaction(function ()  use ($products, $user) {

            $total_price = $products->reduce(function ($carry, $item) {

                return $carry + ($item['price'] * $item['currentQuantity']);
            });

            $data = [];

            $items = $products->mapToGroups(function ($item, $key) use (&$data) {

                return $data[$item['id']] = ['quantity' => $item['currentQuantity']];

            })->toArray();

            $order = Order::Create([
                'status' => "shipping",
                'total_price' => $total_price,
                'user_id' => $user,

            ]);

            $order->products()->attach($data);

            foreach ($data as $key => $value) {

                Product::find($key)->update([
                    'quantity' => DB::raw("quantity - {$value['quantity']}")
                ]);
            }
        });


        return response()->json(['message' => 'order confirmed', 'status' => true], 200);
    }
    public function orders()
    {
        $orders = Order::latest()->get();

        $orders->load("user");

        return response()->json(['orders' => $orders]);
    }
    public function order(Order $order)
    {

        return response()->json(['order' => $order->load(['user', 'products'])]);
    }

    public function customerOrders($id)
    {
        $user = User::find($id);

        $orders = $user->orders;

        $orders->load("products");

        return response()->json(['orders' => $orders, 'total_price' => $orders->sum('total_price')], 200);
    }

    public function updateStatus(Request $request, Order $order)
    {

        //return dd($request->only('status'));

        $order->update($request->only('status'));

        return response(200);
    }
}
