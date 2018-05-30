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

//Route::group(['middleware' => ['api']], function () {
Route::get('/vehicles', 'VehiclesController@getAll');
Route::get('/vehicles/{id}', 'VehiclesController@getOne');

Route::get('/manufacturers', 'ManufacturersController@getAll');
Route::get('/manufacturers/{id}', 'ManufacturersController@getOne');

// Auth
Route::post('/auth/login', 'TokensController@login');
Route::post('/auth/refresh', 'TokensController@refreshToken');
Route::post('/auth/logout', 'TokensController@logout');

//});

Route::group(['middleware' => ['jwt.auth']], function () {
    Route::get('/rentals/user', 'RentalsController@getRentalsByUserId');
    Route::put('/rentals/user/rent-vehicle/{vehicleId}', 'RentalsController@rentVehicle');
    Route::put('/rentals/user/cancel-vehicle/{vehicleId}', 'RentalsController@cancelVehicle');
});