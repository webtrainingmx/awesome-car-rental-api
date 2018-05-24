<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('api')->get('/cars', 'CarsController@getAll');
Route::middleware('api')->get('/cars/{id}', 'CarsController@getOne');

Route::middleware('api')->get('/manufacturers', 'ManufacturersController@getAll');
Route::middleware('api')->get('/manufacturers/{id}', 'ManufacturersController@getOne');