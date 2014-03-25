exports.config = {
  "modules": [
    "copy",
    "server",
    "jshint",
    "csslint",
    "require",
    "minify-js",
    "minify-css",
    "live-reload",
    "bower",
    "coffeescript",
    "less",
    "html-templates"
  ],
  "server": {
    "views": {
      "compileWith": "html",
      "extension": "html"
    },
    "defaultServer": {
      "enabled": true
    }
  },
  "bower": {
      'copy':{
          "unknownMainFullCopy" : true
//            "mainOverrides": {
//                "requirejs-domready": ["domReady.js"],
//                "font-awesome": ["css", "fonts"]
//            }
      }
    }
}