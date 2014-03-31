define [], () ->
  moduleName: 'Auth'
  namespace: 'Auth'
  api:
    currentUser:
      keys:
        email: 'email'
        fullname: 'fullname'
        token: 'token'
        roles: 'roles'
    login:
      path: '/auth/sessions'
      method: 'POST' # can be [GET, POST, HEAD, PUT]
      wrapper: 'user'
      params:
        email: 'email'
        password: 'password'
    logout:
      path: '/auth/sessions'
      method: 'DELETE' # can be [GET, POST, HEAD, PUT]
      params:
        email: 'user_email'
        token: 'user_token'
    passwords:
      path: '/auth/passwords'
      method: 'DELETE' # can be [GET, POST, HEAD, PUT]
      params:
        email: 'user_email'
        token: 'user_token'
    authToken:
      method: 'headers' #prefered method of sending the auth token, options are [params, headers]
      params:
        wrapper: 'user' # used to wrap the params sent back to the server , can be null/false for no wrapper
        mapping: 
          email: 'user_email'
          token: 'user_token'
      headers:
        wrapper: 'user' # used to wrap the headers sent back to the server , can be null/false for no wrapper
        mapping: 
          email: 'X-User-Email'
          token: 'X-User-Token'

