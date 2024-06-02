<template>
  <nav>
    <div>
      <p>こんにちは、<span class="name">{{ name }}</span>さん</p>
      <p class="email">現在{{ email }}でログインです</p>
      <dir class="error">{{ error }}</dir>
    </div>
    <button @click="logout">ログアウト</button>
  </nav>
</template>

<script>
import axios from 'axios'
import removeItem from '../auth/removeItem'
import { getName, getUid } from '../auth/getItem'

export default {
  data() {
    return {
      name: getName(),
      email: getUid(),
      error: null
    }
  },
  methods: {
    async logout() {
      const error_message = 'ログアウトできませんでした'
      const logout_message = 'ログアウトしました'

      this.error = null

      try {
        const res = await axios.delete('http://localhost:3000/auth/sign_out', {
          headers: {
            uid: this.email,
            "access-token": window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client')
          }
        })

        if (!res) {
          new Error(error_message)
        }

        if (!this.error) {
          console.log(logout_message)

          removeItem()

          this.$router.push({ name: 'Welcome' })
        }

        return res
      } catch (error) {
        this.error = error_message
      }
    }
  },
}
</script>

<style scoped>
nav {
  padding: 20px;
  border-bottom: 1px solid #eee;
  display: flex;
  justify-content: space-between;
  align-items: center;
  p {
    margin: 2px auto;
    font-size: 16px;
    color: #444;
  }
  p.email {
    font-size: 14px;
    color: #999;
  }
}
</style>
