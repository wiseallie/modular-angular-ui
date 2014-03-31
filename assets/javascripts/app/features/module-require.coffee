define ['./module-config', './namespace', './module', './module-routes', './auth/module-require', './account/module-require', './module-run'],(config, namespace, module, routes, auth, account, run)->
  config: config
  namespace: namespace
  module: module
  routes: routes
  auth: auth
  account: account
  run: run
