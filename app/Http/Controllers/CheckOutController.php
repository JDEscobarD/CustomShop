<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CheckOutController extends Controller
{
    public function webCheckout(){
        return view('checkout.index');
    }
    //Las demás vistas del checkout
}
