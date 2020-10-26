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
                    <v-btn text disabled>Follow</v-btn>
                </div>
            </v-col>
        </v-row>
    </v-card>
</template>
<script>
    export default {
        props: ['user']
    }
</script>