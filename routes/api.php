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


use Illuminate\Support\Facades\App;
use App\Http\Controllers\CheckerController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\SupervisorController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user()->load('roles');
});

Route::middleware('api','admin')->group(function(){

    Route::get('/orders/{id}',[OrderController::class , 'show']);
    Route::get("/admin/info", [AdminController::class , 'index']);
    Route::get("/products/create" , [ProductController::class , 'create']);
    Route::get('/customers' , [CustomerController::class , 'index']);
    Route::post('/customers' , [CustomerController::class , 'store']);
    Route::post('/customers/{id}' , [CustomerController::class , 'update']);
    Route::get('/customers/{id}/orders' , [CustomerController::class , 'show']);
    Route::get('/customers/{id}/edit' , [CustomerController::class , 'edit']);
    Route::get('/orders',[OrderController::class , 'index']);
    Route::delete('/orders/{id}',[OrderController::class , 'destroy']);
    Route::put('/orders/{order}/status',[OrderController::class , 'updateStatus']);
    Route::post("/order/confirm" , [OrderController::class , 'confirm']);
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy']);
    Route::resource("supervisors",SupervisorController::class);


});

Route::post('/setLang', function (Request $request) {

    App::setLocale($request->_lang);

});

//general routes
Route::apiResource('products', ProductController::class);
Route::apiResource('categories', CategoryController::class);


// Auth Routes
Route::post('/checkAuth', [CheckerController::class, 'Check']);

Route::post("/login", [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('/forgot-password', [PasswordResetLinkController::class, 'store']);
