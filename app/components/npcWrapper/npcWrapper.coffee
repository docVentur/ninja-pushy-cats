angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'npcWrapper', {
  template: require('./npcWrapper.html.hamlc'),
  bindings: {
    npc: "<"
  }


}
