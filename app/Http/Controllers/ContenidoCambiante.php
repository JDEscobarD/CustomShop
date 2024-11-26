<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContenidoCambiante extends Controller
{
    public function products()
    {
        return view('dashboard.products');
    }

    public function new_products()
    {
        return view('dashboard.new-product');
    }

    public function new_category()
    {
        return view('dashboard.new-category');
    }

    public function categories()
    {
        return view('dashboard.categories');
    }

    public function payment()
    {
        return view('dashboard.payment');
    }

    public function history()
    {
        return view('dashboard.history');
    }
}
