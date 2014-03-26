define [
  'lodash'
  'jquery'
  'angular'
  'angularSanitize'
  'angularAnimate'
  'angularCookies'
  'angularUiRouter'
  'angularUiUtils'
  'restangular'
  './namespace'
  './main/module-require'
], (_, $, angular,angularSanitize, angularAnimate,angularCookies, angularUiRouter, angularUiUtils, restangular, namespace, appMain)->
  ngModule = angular.module namespace, [
    'ngAnimate'
    'ngCookies'
    'ngSanitize'
    'restangular'
    'ui.router'
     appMain.namespace
  ]
  ngModule
  