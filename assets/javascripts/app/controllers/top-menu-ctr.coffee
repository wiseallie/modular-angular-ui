define ['../module', '../namespace'], (m,n) ->
  name = n + '.topMenuCtr'
  dependencies = ['$scope']
  controller = ($scope) ->
    $scope.$root.$log.info('ctr-name: ', name,', $stateParams: ', $scope.$root.$stateParams)
    $scope.$root.$log.info("CurrentUser", $scope.$root.authService.currentUser())
    $scope.logout = ()->
      $scope.$root.authService.logout()
    $scope.name = name
  m.controller(name, dependencies.concat(controller))
  console.log(name)
  name