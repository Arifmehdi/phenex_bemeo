<?php

namespace App\Http\Controllers;

use App\Models\Membership;
use Illuminate\Http\Request;

class ShortProfileController extends Controller
{
    function index(Membership $membership)
    {
        return view('short-profile', compact('membership'));
    }
}