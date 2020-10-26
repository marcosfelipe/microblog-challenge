<template>
  <v-card
  elevation="2"
  >
    <new-post />
    <!-- <posts />-->
  </v-card>
</template>
<script>
import newPost from './components/new_post.vue'

export default {
  name: 'Home',
  components: {
    newPost
  }
}
</script>
