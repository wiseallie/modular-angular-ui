define ['angular', './namespace', './module-config', './services/module-require'], (angular, namespace, config, services) ->
  console.log('features/auth/module: ', namespace )
  angular.module namespace, []
    .run ['$rootScope', ($rootScope)->
      $rootScope.authService = services.auth

      $rootScope.CONFIG = {} unless $rootScope.CONFIG
      $rootScope.CONFIG.modules = {} unless $rootScope.CONFIG.modules
      $rootScope.CONFIG.modules[config.moduleName] = config
      $rootScope.CONFIG.modules[config.moduleName].completeNamespace= namespace
      console.log(namespace,'-> run', '$rootScope.CONFIG = ', $rootScope.CONFIG )
    ]
