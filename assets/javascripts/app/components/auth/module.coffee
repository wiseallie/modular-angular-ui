define ['angular', './namespace', './module-config'], (angular, namespace, config) -> 
  console.log('components/auth/module: ', namespace )
  angular.module namespace, []
    .value 'config', config