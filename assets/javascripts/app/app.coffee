define ['./module-require'], (app)->
  app.module.config ['$locationProvider', ($locationProvider)->

  ]
  app.module.run [ '$location', '$rootScope', '$state', '$stateParams', '$log', ($location, $rootScope, $state, $stateParams, $log) ->

    $log.info("App.run")    
    _.assign $rootScope, 
      _: _
      $: $
      $location: $location
      $state: $state
      $stateParams: $stateParams
      $log: $log
  ]
  app.module


  