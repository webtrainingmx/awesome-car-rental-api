<?php

namespace App\Http\Controllers;

use App\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RentalsController extends Controller
{

    public function index()
    {
        $user = Auth::user();
        return view('rentals.index')->with('user', $user);
    }

    public function getRentalsByUserId()
    {
        $user = Auth::user();
        $vehicles = $user->vehicles()->with('manufacturer')->get();

        return response()->json($vehicles, 200);
    }

    public function rentVehicle(Request $request, $vehicleId)
    {
        $user = Auth::user();
        $vehicle = Vehicle::where('id', $vehicleId)->first();

        if ($vehicle->rented) {
            return response(['message' => 'Already rented, please choose another vehicle'], 422);
        }

        // Rent the car
        $vehicle->rented = TRUE;
        $vehicle->save();

        // Store the vehicle related with the user
        $starts_on = $request->input('starts_on');
        $ends_on = $request->input('ends_on');

        $user->vehicles()->attach($vehicle, [
            'starts_on' => $starts_on,
            'ends_on' => $ends_on
        ]);
        return response(['message' => 'Rented'], 200);
    }

}
