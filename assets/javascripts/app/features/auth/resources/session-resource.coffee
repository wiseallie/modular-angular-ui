define ['../module', '../namespace'], (m,n) ->
  name = n + '.sessionResource'
  dependencies = ['$rootScope', '$sanitize', '$cookieStore', '$injector']
  resource = ($rootScope, $sanitize, $cookieStore, $injector) ->
      
  m.factory(name, dependencies.concat(resource))
  name