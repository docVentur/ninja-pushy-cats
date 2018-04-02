angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'growingGenkiness', {
  template: require('./growing_genkiness.html.hamlc'),
  bindings: {
    npc: "<"
  }


}
