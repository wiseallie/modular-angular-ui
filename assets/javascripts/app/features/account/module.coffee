define ['angular', './namespace', './module-config'], (angular, namespace, config) ->
  console.log('features/account/module: ', namespace )
  angular.module namespace, []
