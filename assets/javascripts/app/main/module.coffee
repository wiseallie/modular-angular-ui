define ['angular', './namespace', './module-config', '../components/module-require'], (angular, namespace, config, components) -> 
  console.log('app/main/module: ', namespace )
  console.log('app/main/module-depnendecies:', [components.namespace])
  
  angular.module namespace, [components.namespace]
    .value 'config', config