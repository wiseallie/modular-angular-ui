require ['require', './require-config'],(require, rc) ->
  require [ 'angular', './app/module-require', 'jquery', 'bootstrap', 'lodash','es5Shim'], (angular, ngModule )->
    console.log("we are waiting for dom  to be ready!")
    require ['domReady!'], (document) -> 
      console.log("Dom is ready. Boostraping app on this namespace: ", ngModule.namespace)
      angular.bootstrap(document, [ngModule.namespace])  
  