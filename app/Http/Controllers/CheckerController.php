<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckerController extends Controller
{
    public function Check()
    {
        if(!Auth::check())
        {
            return response()->json([
                'message' => "not Auth",
                'isAdmin' => false,
                'isCustomer' => false
            ]);

        }

         if(Auth::check() && Auth::user()->roles[0]['name'] == 'admin'){

             return response()->json([
                 'message' => "is admin",
                 'isAdmin' => true,
                 'user'   => Auth::user()
             ]);

         }elseif(Auth::check() && Auth::user()->roles[0]['name'] == 'customer'){


            return response()->json([
                'message' => "is Customer",
                'isCustomer' => true,
                'user' => Auth::user()
            ]);



         }

    }

    public function IsCustomer()
    {

        if(Auth::check() && Auth::user()->roles[0]['name'] == 'customer')
        {
            return response()->json([
                'message' => "is Customer",
                'isCustomer' => true,
                'user' => Auth::user()
            ],200);

        }else{
            return response()->json([
                'message' => "Not Customer",
                'isCustomer' => false
            ],401);

        }
    }

    public function CartQuantity()
    {

    }
}
