module AuthorizationHelper
  def sign_in(user)
    post(user_session_path, params: { email: user.email, password: user.password })
    response.headers.slice('client', 'uid', 'token-type', 'access-token')
  end

  def authenticated_headers(tokens)
    headers['client'] = tokens['client']
    headers['uid'] = tokens['uid']
    headers['token-type'] = tokens['token-type']
    headers['access-token'] = tokens['access-token']
  end
end
