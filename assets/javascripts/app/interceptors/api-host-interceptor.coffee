define ['../module', '../namespace'], (m, n) ->
  name = n + '.apiHostInterceptor'
  dependencies = ['$rootScope', '$q']
  interceptor = ($rootScope, $q) ->
    request: (config) ->
      console.log("#{name}-> request, config: ", config)
      if !(/\/templates\//).test(config.url)
        config.url = $rootScope.CONFIG.apiUrl + config.url
      config

  m.factory(name, dependencies.concat(interceptor))
  name
