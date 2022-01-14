import Vue from 'vue'
import App from './App.vue'
import Css from '../src/style/style.css'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Vuex from 'vuex'

Vue.use(Vuex)
Vue.use(VueAxios, axios)
Vue.use(Css)
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
