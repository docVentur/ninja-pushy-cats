angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'kitemiteWrapper', {
  template: require('./kitemiteWrapper.html.hamlc'),
  bindings: {
    npc: "<"
  }


}
