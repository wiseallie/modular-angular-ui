define ['./module-config','./namespace', './module', './module-routes', './resources/module-require', './services/module-require', './controllers/module-require'],(config, namespace, module, routes, resources, services, controllers)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  controllers: controllers
  services: services
  resources: resources