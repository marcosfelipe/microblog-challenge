<template>
    <v-card
     elevation="2"
     class="my-3 pa-5"
     :key="user.id">
        <v-row
                align="center"
                class="spacer"
                no-gutters
        >
            <v-col
                    cols="4"
                    sm="2"
                    md="1"
            >
                <v-avatar color="indigo">
                    <v-icon dark>
                        mdi-account-circle
                    </v-icon>
                </v-avatar>
            </v-col>

            <v-col
                    class="hidden-xs-only"
                    sm="5"
                    md="3"
            >
                <strong >
                    <router-link :to="'/users/' + user.id + '/posts'">{{ user.username }}</router-link>
                </strong>
                <span
                        class="grey--text"
                >
                  &nbsp;
                </span>
            </v-col>
            <v-col
                    class="text-no-wrap"
            >
                <div class="text-right">
                    <v-btn rounded outlined color="cyan" v-if="notFollowing(user.id)" @click="follow(user.id)">Follow</v-btn>
                    <v-btn rounded outlined color="error" v-else @click="unfollow(user.id)">Unfollow</v-btn>
                </div>
            </v-col>
        </v-row>
    </v-card>
</template>
<script>
    export default {
        props: ['user'],
        data: function (){
            return {
                friends: []
            }
        },
        methods: {
            notFollowing: function(userId) {
                return !this.friends.includes(userId)
            },
            fetchMyFriends: function(){
                this.$http.get('/friendships').then(response => {
                    this.friends = response.data.map(friend => friend.id)
                }).catch(response => this.friends = [])
            },
            follow: function(userId){
                this.$http.post('/friendships', { friend_id: userId }).then(response => {
                    this.fetchMyFriends()
                })
            },
            unfollow: function(userId){
                this.$http.delete('/friendships', { data: { friend_id: userId } }).then(response => {
                    this.friends = response.data
                })
            }
        },
        created: function(){
            this.fetchMyFriends()
        }
    }
</script>