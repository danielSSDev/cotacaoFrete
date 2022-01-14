<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCotacaoFretesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cotacao_fretes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('transportadora_id');
            $table->char('uf', 2);
            $table->decimal('percentual_cotacao', 10,2);
            $table->decimal('valor_extra', 10,2);
            $table->timestamps();

            $table->foreign('transportadora_id')->references('id')->on('transportadoras');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cotacao_fretes');
    }
}
