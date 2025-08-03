<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCompositionOption extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_composition_id',
        'option_product_id',
        'precio_adicional',
    ];

    public function productComposition()
    {
        return $this->belongsTo(ProductComposition::class);
    }

    public function optionProduct()
    {
        return $this->belongsTo(Product::class, 'option_product_id');
    }
}