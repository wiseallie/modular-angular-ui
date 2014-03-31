define ['./module-config', './namespace', './module', './module-routes', './auth/module-require', './account/module-require'],(config, namespace, module, routes, auth, account)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  auth: auth
  account: account