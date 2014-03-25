define [
  'angular'
  './namespace'
  './components/home/namespace'
  './components/auth/namespace'
  './application/namespace'
  './components/home/module-require'
  './components/auth/module-require'
  './application/module-require'
], (angular, namespace, homeNamespace, authNamespace, applicationNamespace )->
  app = angular.module namespace, [
    homeNamespace
    authNamespace
    applicationNamespace 
    ]
    
  app.run () ->
  app
  
  
  