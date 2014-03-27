define ['../module', '../namespace'], (m,n) ->
  name = n + '.indexCtr'
  dependencies = ['$scope', '$stateParams']
  controller = ($scope, $stateParams) ->
    $scope.name = name
  m.controller(name, dependencies.concat(controller))
  name