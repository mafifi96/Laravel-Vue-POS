<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;

class CartController extends Controller
{

    public function customerCart()
    {
        $products = Cart::where("user_id", Auth::id())->get();

        $total_price = Cart::where("user_id", Auth::id())->sum('price');

       return response()->json(['Products' => $products , 'totalPrice' => $total_price],200);

    }
}
