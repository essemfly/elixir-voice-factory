import Vue from 'vue';

import Layout from './Layout.vue';
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';

Vue.use(Antd);

new Vue({
  el: '#app',
  data: function () {
    return {};
  },
  render: function (h) {
    return h(Layout);
  }
});