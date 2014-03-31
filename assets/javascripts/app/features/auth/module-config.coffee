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
      requiresAuth: false
      wrapper: 'user'
      params:
        email: 'email'
        password: 'password'
    logout:
      path: '/auth/sessions'
      method: 'DELETE' # can be [GET, POST, HEAD, PUT]
      requiresAuth: true
      params: {}
    passwords:
      path: '/auth/passwords'
      method: 'PUT' # can be [GET, POST, HEAD, PUT]
      requiresAuth: true
      params:
        resetPasswordToken: 'reset_password_token'
        password: 'password'
        passwordConfirmation: 'password_confirmation'
    authToken:
      preferedMethod: 'headers' #prefered method of sending the auth token, options are [params, headers]
      params:
        wrapper: false # used to wrap the params sent back to the server , can be false for no wrapper
        mapping:
          email: 'user_email'
          token: 'user_token'
      headers:
        wrapper: false # used to wrap the headers sent back to the server , can be false for no wrapper
        mapping:
          email: 'X-User-Email'
          token: 'X-User-Token'
