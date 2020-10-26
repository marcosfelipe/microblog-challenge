<template>
    <timeline v-bind:posts="posts" />
</template>
<script>
import timeline from './components/timeline'

export default {
    name: 'Posts',
    data: function(){
        return {
            posts: []
        }
    },
    components: {
        timeline
    },
    created: function(){
        this.$http.get('/posts').then(response => this.posts = response.data)
    }
}
</script>
