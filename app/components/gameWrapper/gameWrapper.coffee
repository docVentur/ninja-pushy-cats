angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'gameWrapper', {
  template: require('./gameWrapper.html.hamlc'),
  bindings: {
    game: "<"
  }

  controller: ($http, $interval, npc_fsm) ->
    vm = @
    @r = Math.random()
    @add_xp = ->
      console.log "added xp"
      npc_fsm.tick(vm.npc)
    @add_yellow_resource = =>
      console.log "added yellow_resource"
      @resources.yellow = @resources.yellow + 1
    @add_orange_resource = =>
      console.log "added orange_resource"
      @resources.orange = @resources.orange + 1
    @add_red_resource = =>
      console.log "added red_resource"
      @resources.red = @resources.red + 1
    @add_purple_resource = =>
      console.log "added purple_resource"
      @resources.purple = @resources.purple + 1
    @add_blue_resource = =>
      console.log "added blue_resource"
      @resources.blue = @resources.blue + 1
    @add_green_resource = =>
      console.log "added green_resource"
      @resources.green = @resources.green + 1
    @add_white_resource = =>
      console.log "added white_resource"
      @resources.white = @resources.white + 1
    @add_black_resource = =>
      console.log "added black_resource"
      @resources.black = @resources.black + 1
    @add_grey_resource = =>
      console.log "added grey_resource"
      @resources.grey = @resources.grey + 1
    @add_pink_resource = =>
      console.log "added pink_resource"
      @resources.pink = @resources.pink + 1

    @
}
