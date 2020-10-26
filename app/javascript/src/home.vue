<template>
  <div>
    <new-post />
    <timeline />
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
  }
}
</script>
