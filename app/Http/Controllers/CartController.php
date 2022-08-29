<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Sessions;


class CartController extends Controller
{
    public function index()
    {
        if (Auth::check()) {

            $items = Cart::where("user_id", Auth::id())->get();
        } else {

            $items = Cart::where("session_id", session()->getId())->get();
        }

        return response()->json(['CartProducts' => $items],200);

        //return view("guest.cart", ['cart_items' => $items]);
    }

    public function add(Request $request)
    {
        $session = Sessions::find(session()->getId());

        if (!$session) {

            $session = new Sessions;
            $session->session_id = session()->getId();
            $session->save();
        }

        $product = Product::findOrFail($request->product_id);
        $user_id = Auth::check() ? Auth::id() : null;
        $productId = $request->product_id;
        $user_session = session()->getId();
        $quantity = $request->quantity;
        $price = $product->price;
        $price = ($quantity * $price);
        $name = $product->title;

        if ($quantity > $product->quantity) {
            return response()->json(['message' => 'quantity not available'], 401);
        }

        if (Auth::check()) {

            $count = Cart::where('user_id', $user_id)
                ->where('product_id', $productId)->count('quantity');
        } else {

            $count = Cart::where('session_id', $user_session)
                ->where('product_id', $productId)->count('quantity');
        }

        if ($count >= 1) {

            $data['quantity'] = $quantity;

            $data['price'] = ($quantity * $price);

            if (Auth::check()) {

                $update = Cart::where('user_id', $user_id)
                    ->where('product_id', $productId)->update($data);
            } else {

                $update = Cart::where('session_id', $user_session)
                    ->where('product_id', $productId)->update($data);
            }
        } else {

            $data = [
                'product_name' => $name,
                'quantity' => $quantity,
                'price' => $price,
                'product_id' => $productId,
                'session_id' => $user_session,
                'user_id' => $user_id,
            ];
            //return response()->json(['message' => $session . " user id " . $user_id],200);

            $cart = new Cart($data);

            if($cart->save()){


                //Cart::create($data);

                return response()->json(['message' => 'product created'], 200);
            }else{
                return response()->json(['message' => 'something is incorrect..'],501);
            }


            //return response(200);


        }
    }

    public function destroy(Request $request)
    {
        $id = $request->product_id;

        if (Auth::check()) {

            $item = Cart::where("user_id", Auth::id())->where("product_id", $id)->delete();

            return response(200);
        } else {

            $item = Cart::where("session_id", session()->getId())->where("product_id", $id)->delete();

            return response(200);
        }
    }

    public function cart_quantity()
    {

        if (Auth::check()) {

            $cart_quantity = Cart::where("user_id", Auth::id())->sum('quantity');

            //$request->session()->put('cart_quantity', $cart_quantity);

        } else {

            $cart_quantity = Cart::where("session_id", session()->getId())->sum('quantity');

            //$request->session()->put('cart_quantity', $cart_quantity);
        }

        return response()->json([
            'quantity' => $cart_quantity
        ]);
    }
}
