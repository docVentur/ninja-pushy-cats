angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'dotmaiowo', {
  template: require('./dotmaiowo.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($state) ->
    vm = @

    @go_next_page = =>
      @npc.iteration = @npc.iteration + 1

      $state.go "mono"
    @
}
