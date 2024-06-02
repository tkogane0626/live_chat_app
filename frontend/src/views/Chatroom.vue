<template>
  <div class="container">
    <Navbar />
    <ChatWindow @connectCable="connectCable" :messages="messages" />
    <NewChatForm @connectCable="connectCable" />
  </div>
</template>

<script>
import axios from 'axios'
import ActionCable from 'actioncable'
import Navbar from '../components/Navbar.vue'
import ChatWindow from '../components/ChatWindow.vue'
import NewChatForm from '../components/NewChatForm.vue'
import { getAccessToken, getClient, getUid } from '../auth/getItem'

export default {
  components: {
    Navbar,
    ChatWindow,
    NewChatForm
  },
  data() {
    return {
      messages: []
    }
  },
  methods: {
    async getMessages() {
      try {
        const response = await axios.get('http://localhost:3000/messages', {
          headers: {
            "access-token": getAccessToken(),
            client: getClient(),
            uid: getUid()
          }
        })

        if (!response) {
          new Error('メッセージ一覧を取得できませんでした')
        }

        this.messages = response.data
      } catch (err) {
        console.log(err)
      }
    },
    connectCable(message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: getUid()
      })
    }
  },
  mounted () {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
    this.messageChannel = cable.subscriptions.create('RoomChannel', {
      connected: () => {
        this.getMessages()
      },
      received: () => {
        this.getMessages()
      }
    })
  },
  beforeUnmount() {
    this.messageChannel.unsubscribe()
  }
}
</script>

<style scoped>

</style>
