// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue'
import TurboLinksAdapter from 'vue-turbolinks'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from '../app.vue'
import Home from '../src/home.vue'
import Posts from '../src/posts.vue'
import VueRouter from 'vue-router'
import axios from 'axios'

axios.defaults.headers.post['X-CSRF-Token'] = document.head.querySelector('meta[name="csrf-token"]').content
Vue.prototype.$http = axios
Vue.use(VueRouter)
Vue.use(Vuetify)
Vue.use(TurboLinksAdapter)
Vue.component('app', App)
Vue.component('home', Home)
Vue.component('posts', Posts)

// routes
const router = new VueRouter({
  routes: [
    { path: '/', component: Home },
    { path: '/posts', component: Posts }
  ]
})

// init
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
    vuetify: new Vuetify(),
    data: { remember_me: [] },
    router
  });
})
