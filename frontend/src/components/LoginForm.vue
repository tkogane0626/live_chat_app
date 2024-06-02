<template>
  <div>
    <h2>ログイン</h2>
    <form @submit.prevent="login">
      <input v-model="email" type="email" placeholder="メールアドレス" required>
      <input v-model="password" type="password" placeholder="パスワード" required>
      <div class="error">{{ error }}</div>
      <button>ログインする</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  emits: [
    'redirectToChatRoom'
  ],
  data() {
    return {
      email: '',
      password: '',
      error: null
    }
  },
  methods: {
    async login() {
      const error_message = 'メールアドレスかパスワードが違います'

      try {
        this.error = null

        const res = await axios.post('http://localhost:3000/auth/sign_in', {
          email: this.email,
          password: this.password
        })

        if (!res) {
          throw new Error(error_message)
        }

        if (!this.error) {
          this.$emit('redirectToChatRoom')
        }

        console.log({ res })
        return res
      } catch (error) {
        console.log({ error })
        this.error = error_message
      }
    }
  }
}
</script>

<style>

</style>
