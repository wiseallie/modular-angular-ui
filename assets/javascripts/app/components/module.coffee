define ['angular', './namespace', './auth/module-require', './home/module-require'], (angular, namespace, auth, home) -> 
  console.log('app/components/module: ', namespace )
  console.log('app/components/module-dependencies:', [auth.namespace, home.namespace])
  angular.module namespace, [auth.namespace, home.namespace]