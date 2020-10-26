<template>
    <v-card
            elevation="2"
            class="my-3"
    >
        <div v-for="user in users" :key="user.id" class="pa-5">
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
                    <strong >{{ user.username }}</strong>
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
                        <v-btn text disabled>Follow</v-btn>
                    </div>
                </v-col>

            </v-row>
        </div>
    </v-card>
</template>
<script>
    export default {
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
