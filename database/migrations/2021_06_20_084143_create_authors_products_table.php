<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAuthorsProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('authors_products', function (Blueprint $table) {
            $table->id();
            $table
                ->foreignId('author_id')
                ->constrained('authors')
                ->onDelete('restrict')
                ->onUpdate('cascade');
            $table
                ->foreignId('product_id')
                ->constrained('products')
                ->onDelete('restrict')
                ->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('authors_products');
    }
}
