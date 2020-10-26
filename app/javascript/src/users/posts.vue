<template>
    <div>
        <timeline :posts="posts" />
    </div>
</template>
<script>
    import Timeline from "../components/timeline";
    export default {
        components: {Timeline},
        data: function(){
            return {
                posts: []
            }
        },
        created: function(){
            this.$http.get('/users/' + this.$route.params.userId + '/posts')
                .then(response => this.posts = response.data)
        }
    }
</script>