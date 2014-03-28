define [
  './module-config'
  './namespace'
  './module'
  './module-routes'
  './controllers/module-require'
  './services/module-require'
  './components/module-require'
  ],(config, namespace, module, routes, controllers, services, components)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  controllers: controllers
  services: services
  components: components
  
  