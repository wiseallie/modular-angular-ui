define ['angular', 'lodash', './namespace', './module', './main/module-require'], (angular, _, namespace, ngModule, main)-> 
  ngModule.config [ '$stateProvider', '$urlRouterProvider', 'CONFIG',  ($stateProvider, $urlRouterProvider, CONFIG) ->
    baseState = "app"
    # let main be the one starting the app
    console.log('config', CONFIG)
    console.log('main.routes', main.routes)
    _.forEach main.routes, (value, feature) ->
      _.forEach value.states, (stateObject) ->
        if stateObject.templateUrl
          obj = _.clone stateObject
          templateLocation = if  value.type == 'component' then  "#{CONFIG.componentsPath}/#{feature}/templates"  else  "#{CONFIG.mainPath}/templates"
          obj.templateUrl = "#{templateLocation}/#{obj.templateUrl}" 
          $stateProvider.state obj
          console.log("register state: ", obj)
        else
          $stateProvider.state stateObject
          console.log("register state: ", stateObject)
      
    $urlRouterProvider.otherwise('/main')
  ]

    
  