require ['require', './require-config'],(require, rc) ->
  require [ 'angular', './app/app', './app/namespace','jquery', 'bootstrap', 'lodash','es5Shim'], (angular, app, namespace)->
    console.log("we are waiting for dom  to be ready!")
    require ['domReady!'], (document) -> 
      console.log("Dom is ready. Boostraping app on this namespace: ", namespace)
      angular.bootstrap(document, [namespace])  
  