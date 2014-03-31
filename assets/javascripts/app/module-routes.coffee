define ['angular', 'lodash', './namespace', './module', './controllers/module-require', './features/module-require'], (angular, _, namespace, ngModule, controllers, features)->
  ngModule.config [ '$stateProvider', '$urlRouterProvider', 'CONFIG',  ($stateProvider, $urlRouterProvider, CONFIG) ->
    name = CONFIG.namespace.toLowerCase()
    routes = _.clone features.routes

    registerModuleState = (type, feature, statesList, mountPath, stateNamePrefix) ->
      _.forEach statesList, (stateObject, index) ->
        stateObject.url = mountPath + stateObject.url if _.has(stateObject, 'url')
        stateObject.name = [stateNamePrefix, stateObject.name].join('.') if stateNamePrefix
        if stateObject.templateUrl
          templateLocation = if type == 'feature' then  "#{CONFIG.featuresPath}/#{feature}/templates"  else CONFIG.templatesPath
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
              template: '<div data-ui-view>Loading content...</div>    '

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
    registerModuleState routes.auth.type, 'auth', routes.auth.states, '/auth', name

    # Register  account states
    registerModuleState routes.account.type, 'account', routes.account.states, '/account', name

    $urlRouterProvider.otherwise('/')
  ]
