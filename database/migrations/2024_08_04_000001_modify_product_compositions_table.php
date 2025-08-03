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
        Schema::table('product_compositions', function (Blueprint $table) {
            // Add new column
            $table->string('nombre_campo')->after('product_id');

            // Drop old columns
            $table->dropForeign(['category_id']);
            $table->dropForeign(['articulo_id']);
            $table->dropColumn(['category_id', 'articulo_id', 'precio_adicional']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('product_compositions', function (Blueprint $table) {
            // Re-add the columns
            $table->foreignId('category_id')->constrained('categories');
            $table->foreignId('articulo_id')->constrained('products');
            $table->decimal('precio_adicional', 10, 2)->default(0);

            // Drop the new column
            $table->dropColumn('nombre_campo');
        });
    }
};