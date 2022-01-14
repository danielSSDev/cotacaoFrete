<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CotacaoFrete extends Model
{
    protected $fillable = [
        'transportadora_id',
        'uf',
        'percentual_cotacao',
        'valor_extra'
    ];
}
