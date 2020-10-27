<template>
    <v-card
            elevation="2"
            class="my-3"
    >
        <v-card-title>Notifications:</v-card-title>
        <v-divider ></v-divider>
        <div v-for="notification in notifications" :key="notification.id">
            <v-card-text>
                {{ notification.message }}
            </v-card-text>
            <v-card-text class="text--secondary">
                {{ notification.created_at }}
            </v-card-text>
            <v-divider ></v-divider>
        </div>
    </v-card>
</template>
<script>
    export default {
        data: function(){
            return {
                notifications: []
            }
        },
        created: function(){
            this.$http.get('/notifications').then(response => this.notifications = response.data)
        }
    }
</script>
