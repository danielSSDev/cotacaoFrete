<template>
  <div id="app">
    <div class="container">
      <div class="row">

        <div class="col">
          <div class="card" style="width: 32rem;">
            <div class="card-body">
              <h5 class="card-title">Cadastro Cotação De Frete</h5>
             
             <div class="form-group col-md-10">
                <label for="inputState">Transportadora</label>
                <select id="transportadora_id" class="form-control" @change="setValorTransportadorId()" v-model="newCotacaoFrete.transportadora">
                  <option v-for="transportadora in transportadoras" :key="transportadora.index">{{ transportadora.nome }} </option>
                </select>
              </div>

               <div class="form-group col-md-10">
                  <label for="inputState">Uf</label>
                  <select id="uf" class="form-control" v-model="newCotacaoFrete.uf">
                    <option v-for="auxUf in uf" :key="auxUf.index" >{{ auxUf.sigla }}</option>
                  </select>
                </div>

                <div class="form-group col-md-10">
                  <label for="inputCity">Percentual cotação (%)</label>
                  <input type="money" class="form-control" id="percentual_cotacao" v-model="newCotacaoFrete.percentual_cotacao">
                </div>

                <div class="form-group col-md-10">
                  <label for="inputCity">Valor extra (R$)</label>
                  <input type="text" class="form-control" id="valor_extra" v-model="newCotacaoFrete.valor_extra">
                </div>

              <a href="#" @click="salvarCotacaoFrete()" class="btn btn-primary btn-salvar">Salvar</a>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card" style="width: 32rem;">
              <div class="card-body">
                <h5 class="card-title">Cotar Frete</h5>

                <div class="form-group col-md-10">
                  <label for="inputState">Uf</label>
                  <select id="uf" class="form-control" v-model="objectCotarFrete.uf">
                     <option v-for="auxUf in uf" :key="auxUf.index" >{{ auxUf.sigla }}</option>
                  </select>
                </div>

                <div class="form-group col-md-10">
                  <label for="inputCity">Valor Pedido</label>
                  <input type="money" class="form-control" id="valor_pedido" v-model="objectCotarFrete.valor_pedido">
                </div>

                <a href="#" @click="cotarFrete()" class="btn btn-primary btn-cotar">Cotar</a>

                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th scope="col">Rank</th>
                      <th scope="col">Transportadora</th>
                      <th scope="col">Valor Cotação</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr v-for="(auxRankCotacaofrete, index) in rankCotacaofrete" :key="index">
                      <th scope="row">{{ index }}</th>
                      <td>{{ auxRankCotacaofrete.transportadora_id }}</td>
                      <td>{{ auxRankCotacaofrete.valor_cotacao }}</td>
                    </tr>
                  </tbody>
                </table>

              </div>
            </div>
        </div>

      </div>
    </div>

    <div class="container">
      <div class="row">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">UF</th>
              <th scope="col">Percentual Frete</th>
              <th scope="col">Valor Taxa</th>
              <th scope="col">Transportadora</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="imposto in impostos" :key="imposto.index">
              <th scope="row">{{ imposto.id }}</th>
              <td>{{ imposto.uf }}</td>
              <td>{{ imposto.percentual_cotacao }}</td>
              <td>{{ imposto.valor_extra }}</td>
              <td>{{ imposto.transportadora_id }}</td>
            </tr>
          </tbody>
        </table>

      </div>
    </div>
  </div>
</template>

<script>

import Vue from 'vue'
export default {
  name: 'App',
  data(){
    return{
      uf:[
          {"sigla": "AC"},
          {"sigla": "AL"},
          {"sigla": "AP"},
          {"sigla": "AM"},
          {"sigla": "BA"},
          {"sigla": "CE"},
          {"sigla": "DF"},
          {"sigla": "ES"},
          {"sigla": "GO"},
          {"sigla": "MA"},
          {"sigla": "MT"},
          {"sigla": "MS"},
          {"sigla": "MG"},
          {"sigla": "PA"},
          {"sigla": "PB"},
          {"sigla": "PR"},
          {"sigla": "PE"},
          {"sigla": "PI"},
          {"sigla": "RJ"},
          {"sigla": "RN"},
          {"sigla": "RS"},
          {"sigla": "RO"},
          {"sigla": "RR"},
          {"sigla": "SC"},
          {"sigla": "SP"},
          {"sigla": "SE"},
          {"sigla": "TO"}
        ],
      impostos: null,
      transportadoras: null,
      rankCotacaofrete: null,
      newCotacaoFrete: {'transportadora_id': 0, 'transportadora': '', 'uf': '', 'percentual_cotacao': 0, 'valor_extra': 0},
      objectCotarFrete: {'uf': '', 'valor_pedido': 0},
      
    }
  },

  methods:{
    getCotacaoFrete(){
      Vue.axios.get('http://127.0.0.1:8000/api/cotacao')
      .then( res =>{

        this.impostos = res.data.data;

      }).catch(function(error){
        alert("Erro ao consultar cotação frete: "+ error)
      })
    },

    getTransportadora(){
      Vue.axios.get('http://127.0.0.1:8000/api/getTransportadora')
      .then( res =>{

        this.transportadoras = res.data.data;

      }).catch(function(error){
        alert('Erro ao consultar transportadora: '+error)
      })
    },

    setValorTransportadorId(){
      this.transportadoras.forEach(res => {
        
        if(res.nome === this.newCotacaoFrete.transportadora){
          this.newCotacaoFrete.transportadora_id = res.id;
        }
      });
    },

    salvarCotacaoFrete(){
       Vue.axios.post('http://127.0.0.1:8000/api/cotacao', this.newCotacaoFrete)
      .then( res =>{
        this.limpeObjetoCotacaoFrete();
        alert(res.data.data);

      }).catch(function(error){
        alert('Erro ao salvar cotação frete: '+error)
      })
    },

    limpeObjetoCotacaoFrete(){
    this.newCotacaoFrete = {'transportadora_id': 0, 'transportadora': '', 'uf': '', 'percentual_cotacao': 0, 'valor_extra': 0}
    },

    limpeObjetpCotarFrete(){
      this.objectCotarFrete = {'uf': '', 'valor_pedido': 0};
    },

    cotarFrete(){
      Vue.axios.put('http://127.0.0.1:8000/api/cotacao'+'?uf='+this.objectCotarFrete.uf+'&valor_pedido='+this.objectCotarFrete.valor_pedido)
        .then( res =>{
          this.limpeObjetpCotarFrete();
          this.rankCotacaofrete = res.data.data
        }).catch(function(error){
          alert('Erro ao cotar frete: '+error)
      })
    }
  },

  watch:{

  },

  mounted(){
    this.getCotacaoFrete();
    this.getTransportadora();
  },

}
</script>

<style>
  #app{
    margin-top: 25px;
  }
  .btn-salvar{
    float: right;
  }
  .btn-cotar{
    margin-left: 14px;
    margin-bottom: 10px;
  }
  .container{
    margin-top:10px;
  }
</style>
