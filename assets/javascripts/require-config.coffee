require
  urlArgs: "b=#{(new Date()).getTime()}"
  paths:
    domReady: 'vendor/requirejs-domready/domReady'
    jquery: 'vendor/jquery/jquery'
    angular: 'vendor/angular/angular'
    angularSanitize: 'vendor/angular-sanitize/angular-sanitize'
    angularAnimate: 'vendor/angular-animate/angular-animate'
    angularCookies: 'vendor/angular-cookies/angular-cookies'
    angularUiRouter: 'vendor/angular-ui-router/angular-ui-router'
    angularUiUtils: 'vendor/angular-ui-utils/ui-utils'
    angularLoadingBar: 'vendor/angular-loading-bar/loading-bar'
    restangular: 'vendor/restangular/restangular'
    bootstrap: 'vendor/bootstrap/bootstrap'
    es5Shim: 'vendor/es5-shim/es5-shim'
    json: 'vendor/json3/json3.min'
    lodash: 'vendor/lodash/lodash.compat'
  shim: 
    angular :
      exports: 'angular'
    angularSanitize:
      deps: ['angular']
    angularAnimate:
      deps: ['angular']
    angularCookies:
      deps: ['angular']
    angularUiRouter:
      deps: ['angular']
    angularUiUtils:
      deps: ['angular']
    restangular:
      deps: ['angular']
    bootstrap:
      deps: ['jquery']
    lodash:
      deps: ['jquery']
      exports: "_"
    json:
      deps: ['jquery', 'lodash']
    angularLoadingBar:
      deps: ['jquery', 'angular']
    