define ['angular', './namespace', './module-config'], (angular, namespace, config) -> 
  console.log('features/home/module: ', namespace )
  angular.module namespace, []
    .value 'config', config