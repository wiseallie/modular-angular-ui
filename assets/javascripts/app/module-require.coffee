define [
  './module-config'
  './namespace'
  './module'
  './controllers/module-require'
  './services/module-require'
  './interceptors/module-require'
  './features/module-require'
  './module-routes'
  './module-run'
  ],(config, namespace, module, controllers, services,interceptors,  features, routes, run)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  controllers: controllers
  services: services
  interceptors: interceptors
  features: features
  routes: routes
  run: run
