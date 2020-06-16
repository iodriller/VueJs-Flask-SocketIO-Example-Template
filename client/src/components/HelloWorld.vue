<template>
    <v-container>
        <v-row
                :align="alignment"
                :justify="justify"
                class="grey lighten-5">
            <v-col cols="12" sm="6">
                <v-btn variant="success" @click="sendMessage">Send message to server</v-btn>
            </v-col>
            <v-col cols="12" sm="6">
                <v-text-field
                        label=""
                        v-model="item.name"
                        single-line
                        outlined
                ></v-text-field>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    const io = require('socket.io-client');

    export default {
        name: 'HelloWorld',

        data() {
            return {
                alignment: 'center',
                justify: 'center',
                item:
                    {
                        name: "click button for server to send message",
                    },
            }
        },
        methods: {
            sendMessage(e) {
                var socket = io.connect('localhost:8050');

                console.log(e)
                socket.emit('SEND_MESSAGE', {
                    msg: this.message
                });
                console.log('message sent to websocket server');
            },
        },

        created: function () {
            var socket = io.connect('localhost:8050');
            setInterval(function () {
                socket.emit('ping', {
                    msg: this.message
                });
                console.log('is the session alive ?')
            }, 10000);
            socket.on('pong', function () {
                console.log('session is alive')
            })

        },
        mounted: function () {
            let self = this
            var socket = io.connect('localhost:8050');
            socket.on('message_to_client', function (d) {
                    self.item['name'] = d["data"]
                }
            )
        }
    }
</script>
