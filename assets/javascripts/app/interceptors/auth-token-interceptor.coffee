define ['../module', '../namespace'], (m, n) ->
  name = n + '.authTokenInterceptor'
  dependencies = ['$rootScope', '$q']
  interceptor = ($rootScope, $q) ->
      request: (config) ->
        authConfig = $rootScope.CONFIG.modules.Auth
        preferedMethod = authConfig.api.authToken.preferedMethod
        console.log("#{name}, -> config:  ", config)
        if preferedMethod == 'headers'

        else if preferedMethod == 'params'

        else
          throw "#{namespace}: invalid  authConfig.api.authToken.preferedMethod #{preferedMethod}"
        config

  m.factory(name, dependencies.concat(interceptor))
  name
