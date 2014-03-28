define ['angular', './module-config', './controllers/module-require', '../components/module-require'], (angular, config, controllers, components)-> 
  name = config.namespace.toLowerCase()
  routes = components.routes
  routes[name] =  
    type: 'app'
    states: [
      new Object 
        name: name
        abstract: true
        templateUrl: 'layout.html'
        controller: controllers.layout,
      new Object
        name: name + '.index'
        url: ''  #important as it will the mount path
        templateUrl: 'index.html'
        controller: controllers.index
    ]
  routes

    
