<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StoreController extends Controller
{
    public function indexWeb()
    {
        return view('shop.index');
    }
    public function webCategories()
    {
        return view('shop.categories');
    }
    public function webProducts()
    {
        return view('shop.products');
    }
}
