<?php

namespace App\Http\Controllers;

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

}
