<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductBrand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\ProductRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Product::with('images', 'category')->get());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $categories = Category::all('id', 'name');

        $brands = ProductBrand::all('id', 'name');

        return response()->json(['categories' => $categories, 'brands' => $brands]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {

         if (! $request->validated()) {
            return response()->json(['errors' => $request->errors()]);
        }

        $request->validate([

            'image' => 'required|mimes:png,jpg,jpeg|max:2048'
        ]);

        $file_name = $request->file('image')->storePublicly('covers');

        $product = Product::create($request->except('image'));

        $image = $product->images()->create(['image' => $file_name]);


        return response()->json(['message' =>  'Product Saved Successfully', 'status' => true], 200);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {

        return response()->json(['product' => $product->load(['images', 'brand', 'category'])], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        return response()->json($product->load('images'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(ProductRequest $request, Product $product)
    {
        //return response()->json(dd($request->all()));

        if (! $request->validated()) {
            return response()->json(['errors' => $request->errors()]);
        }

        $product->update($request->except('image'));

        if($request->has('image')){

            $request->validate([

                'image' => 'mimes:png,jpg,jpeg|max:2048'
            ]);

            $file_name = $request->file('image')->storePublicly('public/covers');

            $image = $product->images()->update(['image' => str_replace('public/','',$file_name)]);

        }
        return response()->json(['message' => "Product Updated"], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return response()->json(['message' => "Product Deleted"], 200);
    }
}
