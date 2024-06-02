<template>
  <div>
    <h2>アカウントを登録</h2>
    <form @submit.prevent="signUp">
      <input v-model="name" type="text" placeholder="名前" required>
      <input v-model="email" type="email" placeholder="メールアドレス" required>
      <input v-model="password" type="password" placeholder="パスワード" required>
      <input v-model="passwordConfirmation" type="password" placeholder="パスワード(確認用)" required>
      <div class="error">{{ error }}</div>
      <button>登録する</button>
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
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      error: null
    }
  },
  methods: {
    async signUp() {
      const error_message = 'アカウントを登録できませんでした'
      this.error = null

      try {
        const res = await axios.post('http://localhost:3000/auth', {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.passwordConfirmation
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
