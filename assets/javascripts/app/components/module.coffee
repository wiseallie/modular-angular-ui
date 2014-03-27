define ['angular', './namespace', './module-config', './auth/module-require', './account/module-require'], (angular, namespace, config, auth, account) -> 
  console.log('app/components/module: ', namespace )
  console.log('app/components/module-dependencies:', [auth.namespace, account.namespace])
  angular.module namespace, [auth.namespace, account.namespace]
    .value 'config', config