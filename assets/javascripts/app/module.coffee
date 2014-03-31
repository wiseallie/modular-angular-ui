define [
  'lodash'
  'jquery'
  'angular'
  'angularSanitize'
  'angularAnimate'
  'angularCookies'
  'angularUiRouter'
  'angularUiUtils'
  'angularLoadingBar'
  'restangular'
  './namespace'
  './module-config'
  './features/module-require'
], (_, $, angular,angularSanitize, angularAnimate,angularCookies, angularUiRouter, angularUiUtils, angularLoadingBar, restangular, namespace, CONFIG, features)->
  ngModule = angular.module namespace, [
    'ngAnimate'
    'ngCookies'
    'ngSanitize'
    'restangular'
    'ui.router'
    'ui.utils'
    'angular-loading-bar'
    features.namespace
    ]

  ngModule.constant 'CONFIG',  CONFIG

  ngModule.config ['$locationProvider', 'cfpLoadingBarProvider', ($locationProvider, cfpLoadingBarProvider)->
    $locationProvider.html5Mode(false).hashPrefix('!')
    cfpLoadingBarProvider.includeSpinner = true
    ]

  ngModule.run [ '$location', '$rootScope', '$state', '$stateParams', '$log', 'CONFIG', features.auth.services.auth, ($location, $rootScope, $state, $stateParams, $log, CONFIG, authService) ->
    $log.info("App.run")
    _.assign $rootScope,
      _: _
      $: $
      $location: $location
      $state: $state
      $stateParams: $stateParams
      $log: $log
      CONFIG:CONFIG
      authService:authService

    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      $log.info("$stateChangeStart -> ", 'event: ', event, 'toState: ', toState, 'toParams: ', toParams, 'fromState: ', fromState, 'fromParams: ', fromParams)

    $rootScope.$on '$stateNotFound', (event, unfoundState, fromState, fromParams) ->
      $log.info("$stateNotFound -> ", 'event: ', event, 'unfoundState: ', unfoundState, 'fromState: ', fromState, 'fromParams: ', fromParams)
    ]
  ngModule
