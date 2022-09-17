<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use App\Http\Requests\CustomerRequest;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function admin()
    {
        $total_products = Product::count();

        $total_cutomers = User::whereHas('roles', function($query){
            $query->where('name','customer');
        })->count();

        $total_categories = Category::count();

        $total_sales = Order::sum("total_price");

        if ($total_sales < 1000000) {

            $total_sales = number_format($total_sales, 0, '.', ',') . "K";
        } elseif ($total_sales >= 1000000) {

            $total_sales = number_format($total_sales, 0, '.', ',') . "M";
        }

        return response()->json([
            'total_customers' => $total_cutomers,
            'total_products' => $total_products,
            'total_sales' => $total_sales,
            'total_categories' => $total_categories
        ]
        );

    }

    public function customers()
    {

         $customers = User::whereHas("roles", function($query){

            $query->where('name', 'customer');

         })->get();

        return response()->json(['customers' => $customers]);

    }

    public function customersCreate(CustomerRequest $request)
    {
        $data = $request->validated();

        $user = User::create($data);

        $user->assignRole("customer");

        return response()->json(['message' => 'User Created Successfully..!']);

    }

    public function customersUpdate(CustomerRequest $request , $id)
    {
        $data = $request->validated();

        $user = User::findOrFail($id);

        $user->update($data);

        return response()->json(['message' => 'User updated Successfully..!']);
    }
    public function Customer($id)
    {
        $customer = User::findOrFail($id);

        return response()->json(['customer' => $customer, 'status' => true], 200);

    }

    public function user_orders($id)
    {
        if (auth()->id() != $id) {
            return back();
        }

        $user = User::findOrFail($id);

        $orders = $user->orders;

        $orders->load("products");

        return view("customer.orders", ['orders' => $orders, 'total_price' => $user->orders->sum('total_price')]);
    }
}
