define ['angular', './namespace', './module-config'], (angular, namespace, config) -> 
  console.log('features/auth/module: ', namespace )
  angular.module namespace, []
    .value 'config', config