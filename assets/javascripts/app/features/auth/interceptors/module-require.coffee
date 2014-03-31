define ['./error-401-interceptor', './auth-token-interceptor'],(authInterceptor, authTokenInterceptor)->
  error401: authInterceptor
  authToken: authTokenInterceptor
