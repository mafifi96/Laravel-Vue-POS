<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Requests\CustomerRequest;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customers = User::whereHas("roles", function($query){

            $query->where('name', 'customer');

         })->get();

        return response()->json(['customers' => $customers]);

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
    public function store(CustomerRequest $request)
    {
        $data = $request->validated();

        $user = User::create($data);

        $user->assignRole("customer");

        return response()->json(['message' => 'User Created Successfully..!']);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);

        $orders = $user->orders;

        $orders->load("products");

        return response()->json(['orders' => $orders, 'total_price' => $orders->sum('total_price')], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customer = User::findOrFail($id);

        return response()->json(['customer' => $customer, 'status' => true], 200);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CustomerRequest $request, $id)
    {
        $data = $request->validated();

        $user = User::findOrFail($id);

        DB::update('update users set name = ? , email = ? , phone = ? , address = ? where id = ?', [$request->name , $request->email , $request->phone , $request->address , $id]);

        return response()->json(['message' => 'User updated Successfully..!']);
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
