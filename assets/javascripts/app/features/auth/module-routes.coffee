define ['angular', './module-config', './controllers/module-require'], (angular, config, controllers)-> 
  name = config.namespace.toLowerCase()
  obj = {}
  obj[name] = 
    type: 'feature'
    states: [
      new Object 
        name: name
        abstract: true
        templateUrl: 'layout.html'
        controller: controllers.layout,
      new Object
        name: name + '.index'
        url: '' #important as it will the mount path
        templateUrl: 'index.html'
        controller: controllers.index
    ]
  obj    

    
