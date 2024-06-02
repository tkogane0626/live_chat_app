import axios from 'axios'
import removeItem from '../auth/removeItem'
import { getAccessToken, getClient, getUid } from '../auth/getItem'
import { ref } from 'vue'

const error = ref(null)
const validate = async () => {
  error.value = null

  const accessToken = getAccessToken()
  const client = getClient()
  const uid = getUid()

  try {
    const res = await axios.get('http://localhost:3000/auth/validate_token', {
      headers: {
        uid: uid,
        'access-token': accessToken,
        client: client
      }
    })

    if (!res) {
      throw new Error('認証に失敗しました')
    }

    return res
  } catch (err) {
    error.value = '認証に失敗しました'

    removeItem()
  }
}

const useValidate = () => {
  return { error, validate }
}

export default useValidate
