define ['angular', './namespace', './module-config'], (angular, namespace, config) ->
  console.log('features/auth/module: ', namespace )
  angular.module namespace, []
    .run ['$rootScope', '$injector', ($rootScope, $injector)->
      $rootScope.authService =  $injector.get("#{namespace}.authService")
      $rootScope.CONFIG = {} unless $rootScope.CONFIG
      $rootScope.CONFIG.modules = {} unless $rootScope.CONFIG.modules
      $rootScope.CONFIG.modules[config.moduleName] = config
      $rootScope.CONFIG.modules[config.moduleName].completeNamespace= namespace
      console.log(namespace,'-> run', '$rootScope.CONFIG = ', $rootScope.CONFIG )
    ]
