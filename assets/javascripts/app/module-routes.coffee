define ['angular', 'lodash', './namespace', './module', './main/module-require'], (angular, _, namespace, ngModule, main)-> 
  ngModule.config [ '$stateProvider', '$urlRouterProvider', 'CONFIG',  ($stateProvider, $urlRouterProvider, CONFIG) ->
    registerModuleState = (type, feature, statesList, mountPath, stateNamePrefix) ->
      _.forEach statesList, (stateObject, index) ->
        stateObject.url = mountPath + stateObject.url if _.has(stateObject, 'url')
        stateObject.name = [stateNamePrefix, stateObject.name].join('.') if stateNamePrefix
        if stateObject.templateUrl
          templateLocation = if type == 'component' then  "#{CONFIG.componentsPath}/#{feature}/templates"  else  "#{CONFIG.mainPath}/templates"
          stateObject.templateUrl = "#{templateLocation}/#{stateObject.templateUrl}" 
          $stateProvider.state stateObject
          console.log("register state: ", stateObject)
        else
          $stateProvider.state stateObject
          console.log("register state: ", stateObject)
            
    # let main be the one starting the app
    console.log('config', CONFIG)
    console.log('main.routes', main.routes)
    
    # Register  main states    
    registerModuleState main.routes.main.type, 'main', main.routes.main.states, '/', null

    # Register  auth states    
    registerModuleState main.routes.auth.type, 'auth', main.routes.auth.states, '/auth', null

    # Register  account states    
    registerModuleState main.routes.account.type, 'account', main.routes.account.states, '/account', null

    $urlRouterProvider.otherwise('/')
  ]

    
  