define ['../module', '../namespace', '../module-config', 'lodash'], (m, n, c, _) ->
  name = n + '.authTokenInterceptor'
  dependencies = ['$rootScope', '$q', '$location']
  interceptor = ($rootScope, $q, $location) ->
      request: (config) ->
        console.log("#{name}#request, config:  ", config)

        authConfig = $rootScope.CONFIG.modules[c.moduleName]
        preferedMethod = authConfig.api.authToken.preferedMethod
        currentUser = $rootScope.authService.currentUser

        if preferedMethod == 'headers'
          wrapper = authConfig.api.authToken.headers.wrapper
          config.headers[wrapper] = {} if wrapper
          _.forEach authConfig.api.authToken.headers, (value, key)->
            if wrapper
              config.headers[wrapper][value] = currentUser[key]
            else
              config.headers[value] = currentUser[key]

        else if preferedMethod == 'params'
          wrapper = authConfig.api.authToken.params.wrapper
          params = {}
          params[wrapper] = {} if wrapper
          _.forEach authConfig.api.authToken.headers, (value, key)->
            if wrapper
              params[wrapper][value] = currentUser[key]
            else
              params[value] = currentUser[key]
          $location.absUrl(config.url)
          $location.search(params)
          config.url = $location.absUrl

        else
          throw "#{namespace}: invalid  #{c.moduleName}.api.authToken.preferedMethod #{preferedMethod}"
        config

  m.factory(name, dependencies.concat(interceptor))
  name
