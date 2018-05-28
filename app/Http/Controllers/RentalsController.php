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

}
