define ['angular', './module-config', './controllers/module-require'], (angular, config, controllers)-> 
  name = config.namespace.toLowerCase()
  obj = {}
  obj[name] = 
    type: 'component'
    states: [
      new Object 
        name: name
        abstract: true
        templateUrl: 'layout.html'
        controller: controllers.layout,
      new Object
        name: name + '.index'
        url: '/'+ name
        templateUrl: 'index.html'
        controller: controllers.index
    ]
  obj    

    
