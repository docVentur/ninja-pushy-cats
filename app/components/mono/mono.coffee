require './0mono.coffee'
require './1mono.coffee'
require './2mono.coffee'
require './3mono.coffee'
require './4mono.coffee'
require './5mono.coffee'
require './6mono.coffee'
require './7mono.coffee'

angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'mono', {
  template: require('./mono.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state) ->
    vm = @
    @r = Math.random()
    @add_xp = ->
      console.log "added xp"
      npc_fsm.tick(vm.npc)
    @add_ai_resource = =>
      console.log "added ai_resource"
      @npc.resources.ai = @npc.resources.ai + 1
      @check_if_finished()

    @add_yellow_resource = =>
      console.log "added yellow_resource"
      @npc.resources.yellow = @npc.resources.yellow + 1
      @check_if_finished()
    @add_orange_resource = =>
      console.log "added orange_resource"
      @npc.resources.orange = @npc.resources.orange + 1
      @check_if_finished()
    @add_red_resource = =>
      console.log "added red_resource"
      @npc.resources.red = @npc.resources.red + 1
      @check_if_finished()
    @add_purple_resource = =>
      console.log "added purple_resource"
      @npc.resources.purple = @npc.resources.purple + 1
      @check_if_finished()
    @add_blue_resource = =>
      console.log "added blue_resource"
      @npc.resources.blue = @npc.resources.blue + 1
      @check_if_finished()
    @add_green_resource = =>
      console.log "added green_resource"
      @npc.resources.green = @npc.resources.green + 1
      @check_if_finished()
    @add_white_resource = =>
      console.log "added white_resource"
      @npc.resources.white = @npc.resources.white + 1
      @check_if_finished()
    @add_black_resource = =>
      console.log "added black_resource"
      @npc.resources.black = @npc.resources.black + 1
      @check_if_finished()
    @add_grey_resource = =>
      console.log "added grey_resource"
      @npc.resources.grey = @npc.resources.grey + 1
      @check_if_finished()
    @add_pink_resource = =>
      console.log "added pink_resource"
      @npc.resources.pink = @npc.resources.pink + 1
      @check_if_finished()

    @is_finished = =>
      for name, count of @npc.resources
        if count == 0
          return false
      return true
    @check_if_finished = =>
      if @is_finished()
        $state.go "sudo"

    @
}
