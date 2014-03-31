define ['./module-config','./namespace', './module', './module-routes', './controllers/module-require', './services/module-require', './module-run'],(config, namespace, module, routes, controllers, services, run)->
  config: config
  namespace: namespace
  module:module
  routes: routes
  controllers: controllers
  services: services
  run: run
