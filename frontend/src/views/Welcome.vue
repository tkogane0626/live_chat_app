<template>
  <div class="container welcome">
    <p>ようこそ！</p>
    <div v-if="shouldShowLoginForm">
      <LoginForm @redirectToChatRoom="redirectToChatRoom" />
      <p class="change-form">初めての方は<span @click="shouldShowLoginForm = false">こちら</span>をクリック</p>
    </div>
    <div v-else>
      <SignupForm @redirectToChatRoom="redirectToChatRoom" />
      <p class="change-form">アカウントをお持ちの方は<span @click="shouldShowLoginForm = true">こちら</span>をクリック</p>
    </div>
  </div>
</template>

<script>
import LoginForm from '../components/LoginForm.vue'
import SignupForm from '../components/SignupForm.vue'

export default {
  components: {
    LoginForm,
    SignupForm
  },
  data() {
    return {
      shouldShowLoginForm: true
    }
  },
  methods: {
    redirectToChatRoom() {
      this.$router.push({ name: 'Chatroom' })
    }
  }
}
</script>

<style>
.welcome {
  text-align: center;
  padding: 20px 0;
  form {
    width: 300px;
    margin: 20px auto;
  }
  label {
    display: block;
    margin: 20px 0 10px;
  }
  input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px auto;
    border-radius: 4px;
    border: 1px solid #eee;
    outline: none;
    box-sizing: border-box;
  }
  span {
    font-weight: bold;
    text-decoration: underline;
    cursor: pointer;
  }
  button {
    margin: 20px auto;
  }
}

.change-form {
  font-size: 14px;
  margin: 10px;
}
</style>
