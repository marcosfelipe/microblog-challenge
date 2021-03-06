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
import Users from '../src/users.vue'
import UsersPosts from '../src/users/posts.vue'
import Notifications from '../src/notifications.vue'
import VueRouter from 'vue-router'
import axios from 'axios'

const csrfTokenEl = document.head.querySelector('meta[name="csrf-token"]')
if(csrfTokenEl) axios.defaults.headers.common['X-CSRF-Token'] = csrfTokenEl.content
axios.defaults.headers.common['accept'] = 'application/json'
axios.interceptors.request.use(function(config) {
  config.url = 'api/v1' + config.url;
  return config;
})
Vue.prototype.$http = axios
window.user = null
Vue.use(VueRouter)
Vue.use(Vuetify)
Vue.use(TurboLinksAdapter)
Vue.component('app', App)
Vue.component('home', Home)
Vue.component('posts', Posts)
Vue.component('users', Users)
Vue.component('users-posts', UsersPosts)
Vue.component('notifications', Notifications)

// routes
const router = new VueRouter({
  routes: [
    { path: '/', component: Home },
    { path: '/posts', component: Posts },
    { path: '/users', component: Users },
    { path: '/users/:userId/posts', component: UsersPosts },
    { path: '/notifications', component: Notifications }
  ]
})

// init
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
    vuetify: new Vuetify(),
    data: function() {
      return {
        remember_me: [],
        rules: {
          required: value => !!value || 'Required.',
          emailMatch: () => (`The email and password you entered don't match`),
        },
      }
    },
    router
  });
})
