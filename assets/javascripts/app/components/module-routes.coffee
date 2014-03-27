define ['angular', 'lodash', './auth/module-require','./account/module-require'], (angular, _, auth, account)-> 
  routes = _.merge {},
    auth.routes
    account.routes
  routes

    
