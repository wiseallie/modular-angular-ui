define ['./namespace','./module', './controllers/module-require', './services/module-require'],(namespace, module, controllers, services)->
  console.log("main/module-require")
  namespace: namespace
  module: module
  controllers: controllers
  services: services
