define ['../module', '../namespace','../module-config', 'lodash'], (m, n, c, _) ->
  name = n + '.authService'
  dependencies = ['$rootScope', '$sanitize', '$cookieStore', '$injector']
  service = ($rootScope, $sanitize, $cookieStore, $injector) ->
    _SESSION = null
    _SESSION_KEY = '_current_user_'
    _INVALID_EMAIL = '-'
    _INVALID_TOKEN = '-'
    _DEFAULT_ROLES = ['guest']

    _GUEST_USER =
      fullName: 'Guest'
      email: _INVALID_EMAIL
      token: _INVALID_TOKEN
      roles: _DEFAULT_ROLES

    _buildSessionData = (sessionData)->
      data = {}
      _.forEach $rootScope.CONFIG.modules[c.moduleName].api.currentUser.keys, (sessionKey, key) ->
        data[key] = sessionData[sessionKey]
      data

    _cacheSession = (session) ->
      $cookieStore.put _SESSION_KEY, session

    _clearSession = () ->
      $cookieStore.put _SESSION_KEY, _GUEST_USER

    _getCurrentUser = () ->
      $cookieStore.get(_SESSION_KEY)|| _GUEST_USER

    _isLoggedIn = () ->
      _getCurrentUser == _GUEST_USER

    _sanitizeCredentials = (credentials) ->
      _data = {}
      _data1 = {}
      _.forEach $rootScope.CONFIG.modules[c.moduleName].api.login.params, (value, key) ->
        _data[value] = $sanitize credentials[key]

      if $rootScope.CONFIG.modules[c.moduleName].api.login.wrapper
        _data1[$rootScope.CONFIG.modules[c.moduleName].api.login.wrapper] = _.clone _data
        _data = _data1
      _data

    currentUser: ()->
      _getCurrentUser()
    isLoggedIn: ()->
      _isLoggedIn()
    clearCurrentUserSession: ()->
      _clearSession()
    logout: ()->(
        _clearSession()
        $rootScope.$broadcast( 'event:success:logout', {success : 'Signed out successfully'}, '200:local')
    )
    login:(credentials)->(
      _SESSION = _SESSION || $injector.get(n + '.sessionResource')
      new _SESSION(_sanitizeCredentials(credentials)).save()
      .then((session)->
          $rootScope.$broadcast('event:success:login', session, '201:local');
          _cacheSession _buildSessionData session
      ,(error) ->
          $rootScope.$broadcast('event:error:login', error);
      )
    )
  m.service(name, dependencies.concat(service))
  name
