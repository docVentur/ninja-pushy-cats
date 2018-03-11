angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'dotowo', {
  template: require('./dotowo.html.hamlc'),
  controller: ($http, $interval) ->
    vm = @

    @updateMaterial = (gg_sudo, material_name, type, amount) =>
      idx = _.findIndex gg_sudo[type], (a) -> a.name == material_name
      if idx >= 0
        gg_sudo[type][idx].amount = amount
      else
        gg_sudo[type].push {name: material_name, amount: amount}
    @deleteMaterial = (gg_sudo, material_name, type) =>
      idx = _.findIndex gg_sudo[type] (a) -> a.name == material_name
      if idx >= 0
        gg_sudo[type].splice idx, 1

    @gg_mono = [{"name":"y"},{"name":"r"},{"name":"b"}]

    @gg_mono_icon = [{"icon":"attachment"},{"icon":"photo"},{"icon":"map"}]

    @gg_sudo =
    [{"name":"o","costs":[{"name":"y","amount":1},{"name":"r","amount":1}],"produces":[{"name":"y","amount":33}],"consumes":[{"name":"y","amount":3}]},{"name":"p","costs":[{"name":"r","amount":1},{"name":"b","amount":1}],"produces":[{"name":"r","amount":15}],"consumes":[{"name":"b","amount":1}]},{"name":"g","costs":[{"name":"b","amount":1},{"name":"y","amount":1}],"produces":[{"name":"b","amount":12}],"consumes":[{"name":"y","amount":3}]}]

    @gg_sudo2 =
    [{"name":"w","costs":[{"name":"y","amount":1},{"name":"r","amount":1},{"name":"b","amount":1}],"produces":[{"name":"y","amount":33},{"name":"r","amount":33},{"name":"b","amount":33}],"consumes":[{"name":"g","amount":1}]},{"name":"p","costs":[{"name":"r","amount":1},{"name":"b","amount":1}],"produces":[{"name":"r","amount":15}],"consumes":[{"name":"b","amount":1}]},{"name":"g","costs":[{"name":"b","amount":1},{"name":"y","amount":1}],"produces":[{"name":"b","amount":12}],"consumes":[{"name":"y","amount":3}]}]

    @gg_sudo3 =
    [{"name":"i","costs":[{"name":"y","amount":1},{"name":"r","amount":1}],"produces":[{"name":"y","amount":33}],"consumes":[{"name":"y","amount":3}]},{"name":"p","costs":[{"name":"r","amount":1},{"name":"b","amount":1}],"produces":[{"name":"r","amount":15}],"consumes":[{"name":"b","amount":1}]},{"name":"g","costs":[{"name":"b","amount":1},{"name":"y","amount":1}],"produces":[{"name":"b","amount":12}],"consumes":[{"name":"y","amount":3}]}]

    @mode = 'gg_game'

    @new_gg_mono_name = ''

    @new_gg_sudo_name = ''

    @add_gg_mono = () =>
      @gg_mono.push {name: @new_gg_mono_name}
      @new_gg_mono_name = ''
      console.log "i did a gg_mono"

    @add_gg_sudo = () =>
      @gg_sudo.push {name: @new_gg_sudo_name, cost: [], produces: [], consumes: [], unlocks: []}
      @new_gg_sudo_name = ''
      console.log "i did a gg_sudo"

    @set_gg_mode = (gg_mode) ->
      @gg_mode = gg_mode

    @reset_gg_game = () =>
      console.log @
      @gg_game = {gg_mono: {}, gg_sudo: {}}

    @gg_game_can_buy_gg_sudo = (name) =>
      for gg_sudo in @gg_sudo
        if gg_sudo.name == name
          for cost in gg_sudo.costs
            return false if (@gg_game.gg_mono[cost.name] or 0) < cost.amount
          return true

    @gg_game_buy_gg_sudo = (name) =>
      return unless @gg_game_can_buy_gg_sudo(name)
      for gg_sudo in @gg_sudo
        if gg_sudo.name == name
          for cost in gg_sudo.costs
            @gg_game.gg_mono[cost.name] = @gg_game.gg_mono[cost.name] - cost.amount
          @gg_game.gg_sudo[gg_sudo.name] = (@gg_game.gg_sudo[gg_sudo.name] or 0) + 1

    @gg_sudo_definition_for_name = (gg_sudo_name) =>
      for gg_sudo in @gg_sudo
        return gg_sudo if gg_sudo.name == gg_sudo_name

    @gg_game_gg_sudo_can_produce = (gg_sudo_name, count) =>
      gg_sudo = @gg_sudo_definition_for_name gg_sudo_name
      for cost in gg_sudo.consumes
        return false if (@gg_game.gg_mono[cost.name] or 0) < (cost.amount * count)
      return true

    @gg_game_gg_sudo_produce = (gg_sudo_name, count) =>
      gg_sudo = @gg_sudo_definition_for_name gg_sudo_name
      for cost in gg_sudo.consumes
        @gg_game.gg_mono[cost.name] = @gg_game.gg_mono[cost.name] - (cost.amount * count)
      for product in gg_sudo.produces
        @gg_game.gg_mono[product.name] = @gg_game.gg_mono[product.name] + product.amount
      return true

    @gg_game_tick = () =>
      for gg_sudo, count of @gg_game.gg_sudo
        if @gg_game_gg_sudo_can_produce gg_sudo, count
          @gg_game_gg_sudo_produce gg_sudo, count
    $interval @gg_game_tick, 1000

    @gg_game_add_gg_mono = (name) =>
      @gg_game.gg_mono[name] = (@gg_game.gg_mono[name] or 0) + 1

    @reset_gg_game()

    @

}
