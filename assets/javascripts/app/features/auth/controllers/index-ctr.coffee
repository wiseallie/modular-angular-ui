define ['../module', '../namespace'], (m,n) ->
  name = n + '.indexCtr'
  dependencies = ['$scope', '$stateParams']
  controller = ($scope, $stateParams) ->
    $scope.name = name
    $scope.login  = (loginForm)->
      
  m.controller(name, dependencies.concat(controller))
  name
