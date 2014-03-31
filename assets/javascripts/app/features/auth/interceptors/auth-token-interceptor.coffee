define ['../module', '../namespace', '../module-config', 'lodash', 'jquery', '../services/module-require'], (m, n, c, _, $, services) ->
  name = n + '.authTokenInterceptor'
  dependencies = ['$rootScope', '$q', '$location', '$injector']
  interceptor = ($rootScope, $q, $location, $injector) ->
      request: (config) ->
        console.log("#{name}#request, config:  ", config)
        if !(/\/templates\//).test(config.url)
          authConfig = $rootScope.CONFIG.modules[c.moduleName]
          preferedMethod = authConfig.api.authToken.preferedMethod
          authService = $injector.get(services.auth)
          currentUser = authService.currentUser()
          console.log("currentUser: ",  currentUser)
          console.log("authConfig: ",  authConfig)

          if preferedMethod == 'headers'
            wrapper = authConfig.api.authToken.headers.wrapper
            config.headers[wrapper] = {} if wrapper
            _.forEach authConfig.api.authToken.headers.mapping, (value, key)->
              if wrapper
                config.headers[wrapper][value] = currentUser[key]
              else
                config.headers[value] = currentUser[key]

          else if preferedMethod == 'params'
            wrapper = authConfig.api.authToken.params.wrapper
            params = {}
            params[wrapper] = {} if wrapper
            console.log(params)
            _.forEach authConfig.api.authToken.params.mapping, (value, key)->
              if wrapper
                params[wrapper][value] = currentUser[key]
              else
                params[value] = currentUser[key]
            a = document.createElement("a")
            a.href = config.url
            authParamsSearch = decodeURIComponent( $.param( params ) )
            console.log( params )
            if a.search != '' and authParamsSearch != ''
                a.search = [a.search, authParamsSearch].join("&")
            else if authParamsSearch != ''
              a.search = authParamsSearch
            config.url = a.href
            $rootScope.$log.info(config.url)

          else
            throw "#{namespace}: invalid  #{c.moduleName}.api.authToken.preferedMethod #{preferedMethod}"
        config

  m.factory(name, dependencies.concat(interceptor))
  name
