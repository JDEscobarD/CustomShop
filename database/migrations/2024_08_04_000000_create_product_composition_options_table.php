<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('product_composition_options', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_composition_id')->constrained('product_compositions')->onDelete('cascade');
            $table->foreignId('option_product_id')->constrained('products')->onDelete('cascade');
            $table->decimal('precio_adicional', 10, 2)->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_composition_options');
    }
};