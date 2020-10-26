<template>
    <div>
        <user v-for="user in users" :user="user" class="pa-5" />
    </div>
</template>
<script>
    import user from './components/user'

    export default {
        name: 'Users',
        components: {user},
        data: function(){
            return {
                users: []
            }
        },
        created: function(){
            this.$http.get('/users').then(response => this.users = response.data)
        }
    }
</script>
