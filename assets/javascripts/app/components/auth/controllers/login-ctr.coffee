define ['../module', '../namespace'], (m,n) ->
  name = n + '.loginCtr'
  dependencies = ['$scope', '$stateParams']
  controller = ($scope, $stateParams) ->
    $scope.name = name
  m.controller(name, dependencies.concat(controller))
  name