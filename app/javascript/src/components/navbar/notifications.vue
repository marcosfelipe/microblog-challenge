<template>
    <v-list-item
        :key="item.title"
        link
        v-if="item.render"
    >
        <v-list-item-icon>
            <v-icon color="blue" v-if="newNotifications">mdi-bell-ring</v-icon>
            <v-icon v-else>mdi-bell-outline</v-icon>
        </v-list-item-icon>

        <v-list-item-content @click="clearNotifications()">
            <router-link :to="item.url">
                <v-list-item-title>
                    {{ item.title }}
                </v-list-item-title>
            </router-link>
        </v-list-item-content>
    </v-list-item>
</template>
<script>
    import consumer from "./../../../channels/consumer"
    export default {
        props: ['item'],
        data: function(){
            return {
                newNotifications: false
            }
        },
        created: function(){
            consumer.subscriptions.create("UserChannel", {
                received: ()=> {
                    this.newNotifications = true
                }
            });
        },
        methods: {
            clearNotifications: function() {
                this.newNotifications = false
            }
        }
    }
</script>
