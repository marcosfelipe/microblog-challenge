<template>
  <v-container fluid  class="pa-0">
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant.sync="mini"
      permanent
      absolute
      expand-on-hover
    >
      <v-list-item class="px-2">
        <v-list-item-avatar>
          <v-img src="https://randomuser.me/api/portraits/men/85.jpg"></v-img>
        </v-list-item-avatar>

        <v-list-item-title>
          <div v-if="username">{{ username }}</div>
          <a v-else href="/users/sign_in">Sign in</a>
        </v-list-item-title>

        <v-btn
          icon
          @click.stop="mini = !mini"
        >
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content @click="drawer = false">
            <router-link :to="item.url">
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </router-link>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-container class="px-15">
      <router-view></router-view>
    </v-container>
  </v-container>
</template>
<script>
  export default {
    props: ['username'],
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Home', icon: 'mdi-home-city', url: '/' },
          { title: 'My Account', icon: 'mdi-account', url: '/posts' },
          //{ title: 'Users', icon: 'mdi-account-group-outline' },
        ],
        mini: true,
      }
    },
  }
</script>
