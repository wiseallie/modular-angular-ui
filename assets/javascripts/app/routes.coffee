define ['angular', './namespace', './module-require'], (angular, namespace, app)-> 
  app.module.config ['$locationProvider', '$stateProvider', '$urlRouterProvider', '$controllerProvider', ($locationProvider, $stateProvider, $urlRouterProvider, $controllerProvider) ->
    console.log($controllerProvider)
    $locationProvider.html5Mode(true).hashPrefix('!')
    $stateProvider
    .state 'application',
      url: "/"
      template: "Welcome to Angular App instanciated by {{name}}"
      controller: app.main.controllers.application
     
    $urlRouterProvider.otherwise("/")
  ]

    
  