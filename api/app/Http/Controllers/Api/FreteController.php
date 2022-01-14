<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Model\CotacaoFrete;
use App\Model\Transportadora;
use Illuminate\Http\Request;

class FreteController extends Controller
{
    protected $transportadora;
    protected $cotacaoFrete;

    public function __construct(Transportadora $transportadora, CotacaoFrete $cotacaoFrete)
    {
        $this->transportadora = $transportadora;
        $this->cotacaofrete   = $cotacaoFrete;
    }

    public function salvarCotacaoFrete(Request $request){
        try{
            $data = $request->all();

            //VALIDAÇÂO DOS CAMPOS E VALIDAÇÂO PARA NÃO PERMITIR REPETIR TRANSPORTADORA_ID E UF NO MESMO CADASTRO.
            $validate = $this->validateCotacaoFrete($data);

            if($validate['value']){
                $this->cotacaofrete::create($data);
                return response()->json(['data' => 'Cotação de frete salva com sucesso!', 'status' => 200]);

            }else{
                return response()->json(['data' => $validate['mensagem'], 'status' => 500]);
            }
        }catch(\Exception $e){
            return response()->json('Erro ao salvar cotação de frete: '.$e->getMessage(), 500);
        }
    }

    public function validateCotacaoFrete($data){
        try{
            $result = [];
            $result['value'] = false;
            //CONSULTA PARA VERIFICAR SE EXISTE TRANPORTADO ID E UF IGUAL O QUE ESTA PARA SER CADASTRADO
            $validate = $this->cotacaofrete::where('transportadora_id', $data['transportadora_id'])
                                            ->where('uf', $data['uf'])
                                            ->get();

            if(count($validate) > 0){
                $result['mensagem'] = 'Cotação de frete com este estado já existe para essa transportadora!';
                return $result;
            }else if($data['uf'] == null){
                $result['mensagem'] = 'O campo UF deve ser preenchido.';
                return $result;
            }else if($data['percentual_cotacao'] == null){
                $result['mensagem'] = 'O campo Percentual Cotação deve ser perrenchido.';
                return $result;
            }else if($data['valor_extra'] == null){
                $result['mensagem'] = 'O campo Valor Extra deve ser preenchido.';
                return $result;
            }else if($data['transportadora_id'] == null){
                $result['mensagem'] = 'Uma transportadora deve ser selecionada.';
                return $result;
            }else{
                $result['value'] = true;
                return $result;
            }

        }catch(\Exception $e){
            return response()->json('Erro Validar cotação frete: '.$e->getMessage(), 500);
        }
    }

    public function getCotacaoImpostosCalculados(Request $request){
        try{
            $data = $request->all();

            $cotacaoFrete = $this->cotacaofrete::where('uf', $data['uf'])->get();

            //VALIDAÇÂO PARA VER SE EXISTE UF
            if(count($cotacaoFrete) > 0){
                $cotacoesCalculadas = $this->logicaCalcularImposto($cotacaoFrete, $data);

                return response()->json(['data' => $cotacoesCalculadas, 'status' => 200]);

            }else{
                return response()->json(['data' => 'Cotação não cadastrada a UF.', 'status' => 500]);
            }

            return response()->json(['data' => $cotacaoFrete, 'status' => true]);

        }catch(\Exception $e){
            return response()->json('Erro ao calcular impostos: '.$e->getMessage(), 500);
        }

    }

    public function logicaCalcularImposto($cotacoesFrete, $data){
        $cotacoes = [];
        $result = [];

        forEach($cotacoesFrete as $cotacao){
            $auxCotacoes = [];
            $valorCotacao = 0;

            $valorCotacao = ($data['valor_pedido']/100 * $cotacao['percentual_cotacao']) + $cotacao['valor_extra'];

            $auxCotacoes['uf'] = $data['uf'];
            $auxCotacoes['valor_pedido'] = $data['valor_pedido'];
            $auxCotacoes['transportadora_id'] = $cotacao['transportadora_id'];
            $auxCotacoes['valor_cotacao'] = $valorCotacao;

            array_push($cotacoes,  $auxCotacoes);

        }

        $cotacoesCalculadas = collect($cotacoes)->sortBy('valor_cotacao')->toArray();

        $count = 0;
        forEach($cotacoesCalculadas as $key => $value){

            if($count < 3){
                array_push($result , $value);
                $count++;
            }
        }

        return $result;
    }

    public function getImpostos(){
        try{
            $impostos = $this->cotacaofrete::all();

            return response()->json(['data' => $impostos, 'status' => 200]);
        }catch(\Exception $e){
            return response()->json('Erro ao consultar impostos: '.$e->getMessage(), 500);
        }
    }

    public function getTransportadora(){
        try{
            $transportadora = $this->transportadora::all();

            return response()->json(['data' => $transportadora, 'status' => 200]);
        }catch(\Exception $e){
            return response()->json('Erro ao consultar impostos: '.$e->getMessage(), 500);
        }
    }

}
