angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'carot', {
  template: require('./carot.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state) ->
    vm = @

    @go_next_page = =>
      @npc.iteration = @npc.iteration + 1

      $state.go "pipe"
    @
}
