<template>
  <section class="card">
    <p class="eyebrow">Vue + Flask-SocketIO</p>
    <h1>WebSocket starter</h1>
    <p class="status" aria-live="polite">{{ status }}</p>
    <button type="button" @click="sendMessage">Send message to server</button>
  </section>
</template>

<script>
import { io } from 'socket.io-client'

const socketUrl = import.meta.env.VITE_SOCKET_URL || 'http://localhost:8050'

export default {
  name: 'HelloWorld',
  data() {
    return {
      socket: null,
      heartbeat: null,
      status: 'Connect to the server, then send a message.',
    }
  },
  mounted() {
    this.socket = io(socketUrl)
    this.socket.on('connect', () => {
      this.status = 'Connected. Ready to send a message.'
    })
    this.socket.on('connect_error', () => {
      this.status = 'Server unavailable. Start the Flask service on port 8050.'
    })
    this.socket.on('message_to_client', ({ data }) => {
      this.status = data
    })
    this.socket.on('pong', () => {
      this.status = 'Connection is alive.'
    })
    this.heartbeat = window.setInterval(() => this.socket?.emit('ping'), 10_000)
  },
  beforeUnmount() {
    window.clearInterval(this.heartbeat)
    this.socket?.disconnect()
  },
  methods: {
    sendMessage() {
      this.socket?.emit('SEND_MESSAGE', { message: 'Hello from Vue' })
    },
  },
}
</script>

<style scoped>
.card {
  width: min(34rem, 100%);
  padding: 2.5rem;
  border: 1px solid #dce3ef;
  border-radius: 1rem;
  background: white;
  box-shadow: 0 1.25rem 3rem rgb(31 49 82 / 10%);
}

.eyebrow {
  margin: 0;
  color: #3568d4;
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

h1 {
  margin: 0.6rem 0;
  font-size: clamp(2rem, 7vw, 3rem);
}

.status {
  min-height: 3rem;
  color: #58657a;
  line-height: 1.5;
}

button {
  width: 100%;
  padding: 0.85rem 1rem;
  border: 0;
  border-radius: 0.65rem;
  color: white;
  background: #3568d4;
  cursor: pointer;
  font: inherit;
  font-weight: 700;
}

button:hover {
  background: #2857bb;
}
</style>
