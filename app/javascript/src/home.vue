<template>
  <div>
    <new-post v-if="userLoggedIn()" />
    <timeline v-if="userLoggedIn()" />
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
  methods: {
    userLoggedIn: function(){
      return window.username
    }
  }
}
</script>
