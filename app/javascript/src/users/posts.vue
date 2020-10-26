<template>
    <div>
        <user :user="user" />
        <timeline :posts="posts" />
    </div>
</template>
<script>
    import Timeline from "../components/timeline";
    import User from "../components/user";
    export default {
        components: {Timeline, User},
        data: function(){
            return {
                posts: [],
                user: {}
            }
        },
        created: function(){
            this.$http.get('/users/' + this.$route.params.userId)
                .then(response => this.user = response.data)
            this.$http.get('/users/' + this.$route.params.userId + '/posts')
                .then(response => this.posts = response.data)
        }
    }
</script>