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
        'bowerDir': {
            'clean': false
        },
        'copy': {
            'unknownMainFullCopy': true,
            'mainOverrides': {
                'requirejs-domready': ['domReady.js'],
                'font-awesome': ['css/', 'fonts/'],
                'bootstrap': ['dist/css/', 'dist/fonts/', 'dist/js/']
            }
        }
    },
    'copy': {
        extensions: ["js", "css", "png", "jpg", "jpeg", "gif", "html", "eot", "svg", "ttf", "woff", "otf", "yaml", "kml", "ico", "htc", "htm", "json", "txt", "xml", "xsd", "map", "md", "mp4", "mp3", 'map']
    }
}