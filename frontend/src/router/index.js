import { createRouter, createWebHistory } from 'vue-router'
import Welcome from '../views/Welcome.vue'
import Chatroom from '../views/Chatroom.vue'
import useValidate from '../auth/validate'
import { getAccessToken, getClient, getUid } from '../auth/getItem'


const { error, validate } = useValidate()
const requireAuth = async (to, from, next) => {
  const accessToken = getAccessToken()
  const client = getClient()
  const uid = getUid()

  if (!uid || !client || !accessToken) {
    console.log('ログインしていません')
    next({ name: 'Welcome' })

    return
  }

  await validate()

  if (error.value) {
    console.log('認証に失敗しました')
    next({ name: 'Welcome' })
  } else {
    next()
  }
}
const noRequireAuth = async (to, from, next) => {
  const accessToken = getAccessToken()
  const client = getClient()
  const uid = getUid()

  if (!uid && !client && !accessToken) {
    next()

    return
  }

  await validate()

  if (!error.value) {
    next({ name: 'Chatroom' })
  } else {
    next()
  }
}
const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome,
    beforeEnter: noRequireAuth
  },
  {
    path: '/chatroom',
    name: 'Chatroom',
    component: Chatroom,
    beforeEnter: requireAuth
  }
]
const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
