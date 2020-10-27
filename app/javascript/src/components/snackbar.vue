<template>
    <div class="text-center">
        <v-snackbar
                v-model="snackbar"
                :vertical="vertical"
        >
            {{ text }}
            <template v-slot:action="{ attrs }">
                <v-btn
                        color="indigo"
                        text
                        v-bind="attrs"
                        @click="snackbar = false"
                >
                    Close
                </v-btn>
            </template>
        </v-snackbar>
    </div>
</template>
<script>
    import consumer from "../../channels/consumer";

    export default {
        data: () => ({
            snackbar: false,
            text: '',
            vertical: true,
        }),
        created: function(){
            consumer.subscriptions.create("UserChannel", {
                received: (data)=> {
                    this.text = data
                    this.snackbar = true
                }
            });
        }
    }
</script>