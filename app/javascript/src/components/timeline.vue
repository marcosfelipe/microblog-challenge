<template>
  <v-card
  elevation="2"
  class="my-3"
  >
    <v-card-title>Timeline</v-card-title>
    <v-divider ></v-divider>
    <div v-for="post in posts" :key="post.id">
      <v-row>
        <v-col cols="2" class="pa-5">
          <v-avatar color="red">
            <v-icon dark>
              mdi-account-circle
            </v-icon>
          </v-avatar>
        </v-col>
        <v-col>
          <v-card-text>
            <b>
              <router-link :to="'/users/' + post.user.id + '/posts'">{{ post.user.username }}</router-link>
            </b>
            - <label class="text--secondary">{{ post.created_at }}</label>
          </v-card-text>
          <v-card-text>
            {{ post.content }}
          </v-card-text>
        </v-col>
      </v-row>
      <v-card-text>
        <div class="text-right">
          <v-btn
                  icon
                  disabled
          >
            <v-icon>mdi-thumb-up</v-icon>
          </v-btn>
          <v-btn @click="destroyPost(post.id)"
                 v-if="currentUser(post.user)"
                 icon
          >
            <v-icon>mdi-trash-can-outline</v-icon>
          </v-btn>
        </div>
      </v-card-text>
      <v-divider ></v-divider>
    </div>
  </v-card>
</template>
<script>
import EventBus from '../event_bus'

export default {
  props: ['posts'],
  methods: {
    destroyPost: function(postId){
      this.$http.delete('/posts/' + postId).then(response => {
        EventBus.$emit('destroy_post', postId)
      })
    },
    currentUser(subjectUser){
      return subjectUser.id == window.user.id
    }
  }
}
</script>
