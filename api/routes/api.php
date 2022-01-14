<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::POST('/cotacao', ['name' => 'frete.cotacao.salvar', 'uses' => 'Api\FreteController@salvarCotacaoFrete']);
Route::PUT('/cotacao', ['name' => 'calculo.imposto', 'uses' => 'Api\FreteController@getCotacaoImpostosCalculados']);
Route::GET('/cotacao', ['name' => 'litar.impostos', 'uses' => 'Api\FreteController@getImpostos']);
Route::GET('/getTransportadora', ['name' => 'get.transportadora', 'uses' => 'Api\FreteController@getTransportadora']);
