<template>
  <div>
    <new-post v-if="userLoggedIn()" />
    <timeline v-if="userLoggedIn()" :posts="posts" />
    <users v-else />
  </div>
</template>
<script>
import timeline from './components/timeline.vue'
import newPost from './components/new_post.vue'
import Users from './users'
import EventBus from './event_bus'

export default {
  name: 'Home',
  components: {
    timeline,
    newPost,
    Users
  },
  data: function(){
    return {
      posts: []
    }
  },
  methods: {
    userLoggedIn: function(){
      return window.user
    },
    fetchPosts: function(){
      this.$http.get('/timeline').then(response => this.posts = response.data)
    }
  },
  created: function(){
    this.fetchPosts()
  },
  mounted: function(){
    EventBus.$on('post', ()=> this.fetchPosts())
  }
}
</script>
