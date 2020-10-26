<template>
  <div>
    <new-post v-if="userLoggedIn()" />
    <timeline v-if="userLoggedIn()" :posts="posts" />
  </div>
</template>
<script>
import timeline from './components/timeline.vue'
import newPost from './components/new_post.vue'

export default {
  name: 'Home',
  components: {
    timeline,
    newPost
  },
  data: function(){
    return {
      posts: []
    }
  },
  methods: {
    userLoggedIn: function(){
      return window.user
    }
  },
  created: function(){
    this.$http.get('/timeline').then(response => this.posts = response.data)
  }
}
</script>
