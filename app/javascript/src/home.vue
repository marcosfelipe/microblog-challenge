<template>
  <div>
    <div v-if="userLoggedIn()">
      <new-post />
      <timeline :posts="posts" />
    </div>
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
    EventBus.$on('post', (post)=> this.posts.unshift(post))
    EventBus.$on('destroy_post', (postId)=> this.posts = this.posts.filter(post => post.id != postId))
  }
}
</script>
