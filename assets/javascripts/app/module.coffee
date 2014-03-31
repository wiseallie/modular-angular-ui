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
  ngModule
