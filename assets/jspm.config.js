SystemJS.config({
  paths: {
    "github:": "jspm_packages/github/",
    "npm:": "jspm_packages/npm/"
  },
  browserConfig: {
    "baseURL": "/assets"
  },
  devConfig: {
    "map": {
      "babel-runtime": "npm:babel-runtime@5.8.38",
      "core-js": "npm:core-js@1.2.7",
      "path": "npm:jspm-nodelibs-path@0.2.1",
      "fs": "npm:jspm-nodelibs-fs@0.2.0",
      "process": "npm:jspm-nodelibs-process@0.2.0",
      "plugin-babel": "npm:systemjs-plugin-babel@0.0.15"
    },
    "packages": {
      "npm:babel-runtime@5.8.38": {
        "map": {}
      },
      "npm:core-js@1.2.7": {
        "map": {
          "systemjs-json": "github:systemjs/plugin-json@0.1.2"
        }
      }
    }
  },
  transpiler: "plugin-babel",
  babelOptions: {
    "optional": [
      "runtime",
      "optimisation.modules.system"
    ]
  },
  map: {
    "babel": "npm:babel-core@5.8.38"
  }
});

SystemJS.config({
  packageConfigPaths: [
    "npm:@*/*.json",
    "npm:*.json",
    "github:*/*.json"
  ],
  map: {
    "jquery": "npm:jquery@2.2.4",
    "modernizr": "github:Modernizr/Modernizr@3.3.1",
    "respond": "github:scottjehl/Respond@1.4.2"
  },
  packages: {}
});
