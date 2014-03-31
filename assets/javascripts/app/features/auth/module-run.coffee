define ['angular', './namespace', './module', './module-config', './services/module-require'], (angular, namespace, ngModule, config, services) ->
  ngModule.run ['$rootScope', '$injector', ($rootScope, $injector)->
      $rootScope.authService = $injector.get(services.auth)
      $rootScope.CONFIG = {} unless $rootScope.CONFIG
      $rootScope.CONFIG.modules = {} unless $rootScope.CONFIG.modules
      $rootScope.CONFIG.modules[config.moduleName] = config
      $rootScope.CONFIG.modules[config.moduleName].completeNamespace = namespace
      console.log(namespace,'-> run', '$rootScope.CONFIG = ', $rootScope.CONFIG )
    ]
