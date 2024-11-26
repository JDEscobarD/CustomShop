<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\ContenidoCambiante;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\StoreController;


//Rutas CMS CustomShop
Route::get('/', [LoginController::class, 'showLoginForm'])->name('login');
Route::get('/dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
Route::get('/productos', [ContenidoCambiante::class, 'products'])->name('products');
Route::get('/nuevo-producto', [ContenidoCambiante::class, 'new_products'])->name('new_products');
Route::get('/categorias', [ContenidoCambiante::class, 'categories'])->name('categories');
Route::get('/nueva-categoria', [ContenidoCambiante::class, 'new_category'])->name('new_category');
Route::get('/historial-pedidos', [ContenidoCambiante::class, 'history'])->name('history');
Route::get('/medios-pagos', [ContenidoCambiante::class, 'payment'])->name('payment');

//Login
Route::middleware(['auth'])->group(function(){
    //Rutas protegidas
});

//Rutas de la tienda
Route::get('/tienda-online', [StoreController::class, 'indexWeb'])->name('storeweb');
Route::get('/tienda-online/categorias', [StoreController::class, 'webCategories'])->name('categoriesweb');
Route::get('/tienda-online/prodcutos', [StoreController::class, 'webProducts'])->name('productsweb');