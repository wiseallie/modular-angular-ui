define ['angular', './namespace', './module-config'], (angular, namespace, config) ->
  console.log('features/account/module: ', namespace )
  angular.module namespace, []
    .value 'config', config
    .run ['$rootScope', ($rootScope)->
      $rootScope.CONFIG = {} unless $rootScope.CONFIG
      $rootScope.CONFIG.modules = {} unless $rootScope.CONFIG.modules
      $rootScope.CONFIG.modules[config.moduleName] = config
      $rootScope.CONFIG.modules[config.moduleName].completeNamespace= namespace
      console.log(namespace,'-> run', '$rootScope.CONFIG = ', $rootScope.CONFIG )
    ]
