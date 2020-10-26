<template>
    <div>
        <user :user="user" />
        <timeline v-bind:posts="posts" />
    </div>
</template>
<script>
import timeline from './components/timeline'
import User from './components/user'

export default {
    name: 'Posts',
    data: function(){
        return {
            posts: [],
            user: {}
        }
    },
    components: {
        timeline,
        User
    },
    created: function(){
        this.$http.get('/users/' + window.user.id).then(response => this.user = response.data)
        this.$http.get('/posts').then(response => this.posts = response.data)
    }
}
</script>
