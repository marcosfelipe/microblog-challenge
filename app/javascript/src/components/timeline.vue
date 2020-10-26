<template>
  <v-card
  elevation="2"
  class="my-3"
  >
    <div v-for="post in posts" :key="post.id">
      <v-card-text class="font-weight-black">{{ post.user.username }} - {{ post.created_at }}</v-card-text>
      <v-card-text>
        {{ post.content }}
        <div class="text-right">
          <v-btn
                  icon
                  disabled
          >
            <v-icon>mdi-thumb-up</v-icon>
          </v-btn>
        </div>
      </v-card-text>
      <v-divider ></v-divider>
    </div>
  </v-card>
</template>
<script>
export default {
  props: ['posts']
}
</script>
