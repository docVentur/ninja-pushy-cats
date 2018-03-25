angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'pipe', {
  template: require('./pipe.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state) ->
    vm = @
    @go_next_page = =>
      $state.go "dot"
    @
}
