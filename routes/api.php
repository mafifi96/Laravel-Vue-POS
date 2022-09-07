<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


use App\Http\Controllers\CheckerController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Api\CartController As ApiCart;
use App\Http\Controllers\Api\OrderController;
use App\Models\Product;
use Illuminate\Support\Facades\App;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user()->load('roles');
});

Route::middleware('api','admin')->group(function(){
    Route::get("/admin/info", [UserController::class , 'admin']);
    Route::get("/products/create" , [ProductController::class , 'create']);
    Route::get("/customer/cart" , [ApiCart::class , 'customerCart']);
    Route::get("/customer/orders" , [OrderController::class , 'customerOrders']);
    Route::get('/customers' , [UserController::class , 'customers']);
    Route::post('/customers' , [UserController::class , 'customersCreate']);
    Route::get('/customers/{id}/orders' , [OrderController::class , 'customerOrders']);
    //Route::get('/orders/{order}',[OrderController::class , 'order']);
    Route::put('/orders/{order}/status',[OrderController::class , 'updateStatus']);
    Route::post("/order/confirm" , [OrderController::class , 'confirm']);
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy']);

});

Route::post('/session', function () {
    $session = session()->getId();
    return response()->json(['message' => $session]);
});

Route::post('/setLang', function (Request $request) {

    App::setLocale($request->_lang);

    //return response()->json(['lang' => $request->_lang , 'translate'=>require lang_path($request->_lang . "/translation.php")]);
});

//general routes
Route::apiResource('products', ProductController::class);
Route::apiResource('categories', CategoryController::class);
Route::post("/productss/{product}", function(Request $request , Product $product ){
    return response()->json(dd($request->all()));
});
/* -- */

Route::get('/brand/{brand}', [GuestController::class, 'brand'])->where(['brand' => '[0-9]+']);
Route::get("/search", [GuestController::class, 'search']);
Route::get("/cart", [CartController::class, 'index']);
Route::post("/cart/add", [CartController::class, 'add']);
Route::post("/cart/quantity", [CartController::class, 'cart_quantity']);
Route::post("/cart/delete", [CartController::class, 'destroy']);
Route::post('/customer/info', [UserController::class, 'customer_info']);

// Auth Routes
Route::post('/checkAuth', [CheckerController::class, 'Check']);

Route::post("/login", [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/forgot-password', [PasswordResetLinkController::class, 'store']);
