define ['angular', './namespace', './module-config', './auth/module-require', './account/module-require'], (angular, namespace, config, auth, account) ->
  console.log('app/features/module: ', namespace, 'module-dependencies:', [auth.namespace, account.namespace] )
  angular.module namespace, [auth.namespace, account.namespace]
    .run ['$rootScope', ($rootScope)->
      $rootScope.CONFIG = {} unless $rootScope.CONFIG
      $rootScope.CONFIG.modules = {} unless $rootScope.CONFIG.modules
      $rootScope.CONFIG.modules[config.moduleName] = config
      $rootScope.CONFIG.modules[config.moduleName]['completeNamespace'] = namespace
      console.log(namespace,'-> run', '$rootScope.CONFIG = ', $rootScope.CONFIG )
    ]
