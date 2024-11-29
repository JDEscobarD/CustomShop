<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TiendaController extends Controller
{
    public function mostrarProducto()
    {
        return view('shop.single-product');        
    }
}
