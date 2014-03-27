define ['angular', './namespace', './module-config'], (angular, namespace, config) -> 
  console.log('components/home/module: ', namespace )
  angular.module namespace, []
    .value 'config', config