define ['angular', 'lodash', './namespace', './module', './controllers/module-require', './components/module-require'], (angular, _, namespace, ngModule, controllers, components)-> 
  ngModule.config [ '$stateProvider', '$urlRouterProvider', 'CONFIG',  ($stateProvider, $urlRouterProvider, CONFIG) ->
    name = CONFIG.namespace.toLowerCase()
    routes = _.clone components.routes
    
    registerModuleState = (type, feature, statesList, mountPath, stateNamePrefix) ->
      _.forEach statesList, (stateObject, index) ->
        stateObject.url = mountPath + stateObject.url if _.has(stateObject, 'url')
        stateObject.name = [stateNamePrefix, stateObject.name].join('.') if stateNamePrefix
        if stateObject.templateUrl
          templateLocation = if type == 'component' then  "#{CONFIG.componentsPath}/#{feature}/templates"  else CONFIG.templatesPath
          stateObject.templateUrl = "#{templateLocation}/#{stateObject.templateUrl}" 
          $stateProvider.state stateObject
          console.log("register state: ", stateObject)
        else
          $stateProvider.state stateObject
          console.log("register state: ", stateObject)
            
    
    routes[name] =  
      type: 'app'
      states: [
        new Object 
          name: name
          abstract: true
          controller: controllers.layout
          views:            
            topMenu: 
              controller: controllers.topMenu
              templateUrl: CONFIG.templatesPath+ '/top-menu.html'
            content: 
              templateUrl: CONFIG.templatesPath+ '/content.html'

        new Object
          name: name + '.index'
          url: ''  #important as it will the mount path
          templateUrl: 'index.html'
          controller: controllers.index
      ]

    # let main be the one starting the app
    console.log('config', CONFIG)
    console.log('routes', routes)

    
    # Register  main states    
    registerModuleState routes[name].type, name, routes[name].states, '/'

    # Register  auth states    
    registerModuleState routes.auth.type, 'auth', routes.auth.states, '/auth'

    # Register  account states    
    registerModuleState routes.account.type, 'account', routes.account.states, '/account'

    $urlRouterProvider.otherwise('/')
  ]

    
  