<template>
    <div>
        <user v-for="user in users" :user="user" class="pa-5" />
    </div>
</template>
<script>
    import User from './components/user'

    export default {
        name: 'Users',
        components: {User},
        data: function(){
            return {
                users: []
            }
        },
        created: function(){
            this.$http.get('/users').then(response => {
                if(response.status == 200) this.users = response.data
            }).catch(()=> this.users = [])
        }
    }
</script>
