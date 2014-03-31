define ['./api-host-interceptor','./auth-token-interceptor'],(apiHostInterceptor, authTokenInterceptor)->
  apiHost: apiHostInterceptor
  authToken: authTokenInterceptor
