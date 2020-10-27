<template>
  <v-card
  elevation="2"
  >
    <v-card-text>
      <v-text-field placeholder="What's happening?" v-model="content"></v-text-field>
      <div class="text-right">
        <v-btn color="primary" @click="post" :disabled="!content" rounded>Post</v-btn>
      </div>
    </v-card-text>
  </v-card>
</template>
<script>
import EventBus from '../event_bus'

export default {
  data: function() {
    return {
      content: null
    }
  },
  methods: {
    post() {
    this.$http.post("/posts", { post: { content: this.content } })
      .then(response => {
        this.content = null
        EventBus.$emit('post', response.data)
      });
    }
  }
}
</script>
