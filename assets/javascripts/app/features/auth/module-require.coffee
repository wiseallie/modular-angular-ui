define ['./module-config','./namespace', './module', './module-routes', './resources/module-require', './services/module-require', './interceptors/module-require', './controllers/module-require'],(config, namespace, module, routes, resources, services, interceptors,controllers)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  controllers: controllers
  services: services
  interceptors: interceptors
  resources: resources
