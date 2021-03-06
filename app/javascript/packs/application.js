/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import Vue from 'vue/dist/vue.esm'
// import VueResource from 'vue-resource'
import Vuetify from 'vuetify'
import App from '../app.vue'
import router from '../router'
import { store } from '../store'
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

Vue.use(Vuetify)
// Vue.use(VueResource)


document.addEventListener('DOMContentLoaded', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector("meta[name=csrf-token]").content;

  const app = new Vue({
    el: '#app',
    router,
    store,
    template: '<App />',
    components: { App },
    // beforeMount: function() {

    // }
    mounted: function() {
      // if (this.$store.getters.categories.length < 1) {
      //   this.$router.push('/');
      // }
      console.log(this.$router.history.current.params.id);
    }
  });

});
