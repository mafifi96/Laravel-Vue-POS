<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use App\Models\Category;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
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

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
