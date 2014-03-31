define ['../module', '../namespace'], (m, n) ->
  name = n + '.error401Interceptor'
  dependencies = ['$rootScope', '$q']
  interceptor = ($rootScope, $q) ->
    responseError: (rejection) ->
      console.log("#{name}#responseError, rejection:  ", rejection)
      if rejection.status == 401
        $rootScope.$broadcast 'event:error:401', rejection.data, rejection.status
      $q.reject(rejection)

  m.factory(name, dependencies.concat(interceptor))
  name
