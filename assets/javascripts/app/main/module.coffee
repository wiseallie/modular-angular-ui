define ['angular', './namespace', '../components/module-require'], (angular, namespace, components) -> 
  console.log('app/main/module: ', namespace )
  console.log('app/main/module-depnendecies:', [components.namespace])
  
  angular.module namespace, [components.namespace]