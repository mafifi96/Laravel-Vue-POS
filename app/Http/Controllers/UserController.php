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

        $total_cutomers = User::with('roles')->get()->filter(function($user){
            return $user->roles[0]->name == 'customer';
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

/*     public function customer()
    {
        $products = Auth::user()->cart;

        $total_price = Cart::where("user_id", Auth::id())->sum('price');

        // return view('customer.profile', ['products' => $products, 'total_price' => $total_price]);

        return response()->json(['products' => $products, 'totalPrice' => $total_price], 200);
    }
 */
    public function customers()
    {

        /* $customers = User::with(['roles:c'=> function ($query) {
            $query->where('name','customer');
        }])->get();
         */
        $customers = User::with('roles')->get()->reject(function($user){
            return $user->roles[0]->name == 'admin' || $user->roles[0]->name == 'supervisor';
        });

        return response()->json(['customers' => $customers]);
    }

    public function customersCreate(CustomerRequest $request)
    {
        $data = $request->validated();

        $user = User::create($data);

        $user->assignRole("customer");

        return response()->json(['message' => 'User Created Successfully..!']);
    }

    public function checkout()
    {

        if (Auth::check()) {
            return redirect("/customer");
        }
        return view('guest.check');
    }

    public function customer_info(CustomerRequest $request)
    {

        $session_id = session()->getId();

        $user = User::create($request->validated());

        $user->assignRole("customer");

        event(new Registered($user));

        Auth::login($user);

        $u_id = Auth::id();

        $cart = DB::update('update carts set user_id = ? where session_id = ?', [$u_id, $session_id]);

        return response()->json(['message' => 'user logged in successfully', 'status' => true], 200);
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
