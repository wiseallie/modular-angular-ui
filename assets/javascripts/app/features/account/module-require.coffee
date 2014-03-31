define ['./module-config','./namespace', './module', './module-routes', './controllers/module-require', './services/module-require'],(config, namespace, module, routes, controllers, services)->
  config: config
  namespace: namespace
  module:module
  routes: routes
  controllers: controllers
  services: services