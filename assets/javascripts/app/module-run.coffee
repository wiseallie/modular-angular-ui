define ['angular', 'lodash', './namespace', './module', './interceptors/module-require', './features/module-require'], (angular, _, namespace, ngModule, interceptors, features)->
  # Ajax requests spinner
  ngModule.config ['cfpLoadingBarProvider', (cfpLoadingBarProvider)->
      cfpLoadingBarProvider.includeSpinner = true
    ]

  # push the interceptors and add default crossdomain settings
  ngModule.config ['$httpProvider', ($httpProvider)->
      $httpProvider.defaults.useXDomain = true
      $httpProvider.defaults.withCredentials = true
      $httpProvider.defaults.headers.common['Content-Type'] = 'application/json; charset=UTF-8'
      delete $httpProvider.defaults.headers.common['X-Requested-With']


      $httpProvider.interceptors.push features.auth.interceptors.error401
      $httpProvider.interceptors.push features.auth.interceptors.authToken
      $httpProvider.interceptors.push interceptors.apiHost
      console.log('$httpProvider.interceptors: ',$httpProvider.interceptors)

    ]

  ngModule.run [ '$location', '$rootScope', '$state', '$stateParams', '$log', 'CONFIG', features.auth.services.auth, ($location, $rootScope, $state, $stateParams, $log, CONFIG, authService) ->
    $log.info("App.run")
    _CONFIG = _.merge($rootScope.CONFIG||{}, CONFIG)
    _.assign $rootScope,
      _: _
      $: $
      $location: $location
      $state: $state
      $stateParams: $stateParams
      $log: $log
      CONFIG:_CONFIG

    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      $log.info("$stateChangeStart -> ", 'event: ', event, 'toState: ', toState, 'toParams: ', toParams, 'fromState: ', fromState, 'fromParams: ', fromParams)

    $rootScope.$on '$stateNotFound', (event, unfoundState, fromState, fromParams) ->
      $log.info("$stateNotFound -> ", 'event: ', event, 'unfoundState: ', unfoundState, 'fromState: ', fromState, 'fromParams: ', fromParams)
    ]
  ngModule
