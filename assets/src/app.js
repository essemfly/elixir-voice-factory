import Vue from 'vue';
import Eosjs from 'eosjs';
import App from './App.vue';
// import Main from './Main.vue'

new Vue({
  el: '#app',
  data: function() {
    const config = {
      chainId: "038f4b0fc8ff18a4f0842a8f0564611f6e96e8535901dd45e43ac8691a1c4dca",
      keyProvider: ["5KRfhNCjRqixYZsdvoLyM2ZgeUm8SrjoKN56HFCxw2a9AsQnaP7"],
      httpEndpoint: "http://alex.chain.partners:8832",
      expireInSeconds: 60,
      broadcast: true,
      verbose: false,
      sign: true
    };

    return {
      eos: Eosjs(config),
      options: {
        authorization: ["daybit@active"],
        broadcast: true,
        sign: true
      }
    };
  },
  render: function(h) {
    const path = window.location.pathname;
    console.log(path);
    switch(path) {
      case "/main":
        return h(App);
    }
  }
})