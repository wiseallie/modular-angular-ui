define ['../module', '../namespace'], (m,n) ->
  name = n + '.topMenuCtr'
  dependencies = ['$scope']
  controller = ($scope) ->
    $scope.$root.$log.info('ctr-name: ', name,', $stateParams: ', $scope.$root.$stateParams)
    $scope.name = name
  m.controller(name, dependencies.concat(controller))
  console.log(name)
  name