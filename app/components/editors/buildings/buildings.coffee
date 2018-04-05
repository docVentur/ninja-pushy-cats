angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

#resources
# [{"name":"Catnip"},{"name":"Wood"}]
# buildings
# [{"name":"Farm","costs":[{"name":"Wood","amount":"5"}],"produces":[]}]
# game
# {"resources":{"Catnip":10,"Wood":5},"buildings":{"Farm":1}}

app.component 'editorBuildings', {
  template: require('./buildings.html.hamlc'),
  controller: ($http, $interval) ->
    vm = @
    @updateMaterial = (building, material_name, type, amount) =>
      idx = _.findIndex building[type], (a) -> a.name == material_name
      if idx >= 0
        building[type][idx].amount = amount
      else
        building[type].push {name: material_name, amount: amount}
    @deleteMaterial = (building, material_name, type) =>
      idx = _.findIndex building[type] (a) -> a.name == material_name
      if idx >= 0
        building[type].splice idx, 1
    @resources = [{"name":"attachment"},{"name":"photo"},{"name":"map"}]
    @gg_mono = [{"name":"y"},{"name":"r"},{"name":"b"}]

    @resources_icon = [{"icon":"attachment"},{"icon":"photo"},{"icon":"map"}]
    @gg_mono_icon = [{"icon":"attachment"},{"icon":"photo"},{"icon":"map"}]

    @buildings = [{"name":"content_copy","costs":[{"name":"attachment","amount":1},{"name":"photo","amount":1}],"produces":[{"name":"attachment","amount":33}],"consumes":[{"name":"attachment","amount":3}]},{"name":"developer_board","costs":[{"name":"photo","amount":1},{"name":"map","amount":1}],"produces":[{"name":"photo","amount":15}],"consumes":[{"name":"photo","amount":1}]},{"name":"business","costs":[{"name":"map","amount":1},{"name":"attachment","amount":1}],"produces":[{"name":"map","amount":12}],"consumes":[{"name":"attachment","amount":3}]}]
    @gg_sudo =
    [{"name":"o","costs":[{"name":"y","amount":1},{"name":"r","amount":1}],"produces":[{"name":"y","amount":33}],"consumes":[{"name":"y","amount":3}]},{"name":"p","costs":[{"name":"r","amount":1},{"name":"b","amount":1}],"produces":[{"name":"r","amount":15}],"consumes":[{"name":"b","amount":1}]},{"name":"g","costs":[{"name":"b","amount":1},{"name":"y","amount":1}],"produces":[{"name":"b","amount":12}],"consumes":[{"name":"y","amount":3}]}]

    @mode = 'game'
    @mode = 'gGame'

    @new_resource_name = ''
    @new_gg_mono_name = ''

    @new_building_name = ''
    @new_gg_sudo_name = ''

    @add_resource = () =>
      @resources.push {name: @new_resource_name}
      @new_resource_name = ''
    @add_gg_mono = () =>
      @gg_mono.push {name: @new_gg_mono_name}
      @new_gg_mono_name = ''

    @add_building = () =>
      @buildings.push {name: @new_building_name, costs: [], produces: [], consumes: [], unlocks: []}
      @new_building_name = ''
    @add_sudo = () =>
      @sudo.push {name: @new_sudo_name, cost: [], produces: [], consumes: [], unlocks: []}
      @new_sudo_name = ''

    @set_mode = (mode) ->
      @mode = mode
    @set_mode = (gg_mode) ->
      @gg_mode = gg_mode

    @reset_game = () =>
      console.log @
      @game = {resources: {}, buildings: {}}
    @reset_gg_game = () =>
      console.log @
      @gg_game = {gg_mono: {}, gg_sudo: {}}

    @game_can_buy_building = (name) =>
      for building in @buildings
        if building.name == name
          for cost in building.costs
            return false if (@game.resources[cost.name] or 0) < cost.amount
          return true
    @gg_game_can_buy_gg_sudo = (name) =>
      for gg_sudo in @gg_sudo
        if gg_sudo.name == name
          for cost in gg_sudo.costs
            return false if (@gg_game.gg_mono[cost.name] or 0) < cost.amount
          return true

    @game_buy_building = (name) =>
      return unless @game_can_buy_building(name)
      for building in @buildings
        if building.name == name
          for cost in building.costs
            @game.resources[cost.name] = @game.resources[cost.name] - cost.amount
          @game.buildings[building.name] = (@game.buildings[building.name] or 0) + 1
    @gg_game_buy_gg_sudo = (name) =>
      return unless @game_can_buy_gg_sudo(name)
      for gg_sudo in @gg_sudo
        if gg_sudo.name == name
          for cost in gg_sudo.costs
            @game.gg_mono[cost.name] = @game.gg_mono[cost.name] - cost.amount
          @game.gg_sudo[gg_sudo.name] = (@game.gg_sudo[gg_sudo.name] or 0) + 1

    @building_definition_for_name = (building_name) =>
      for building in @buildings
        return building if building.name == building_name
    @gg_sudo_definition_for_name = (gg_sudo_name) =>
      for gg_sudo in @gg_sudo
        return gg_sudo if gg_sudo.name == gg_sudo_name

    @game_building_can_produce = (building_name, count) =>
      building = @building_definition_for_name building_name
      for cost in building.consumes
        return false if (@game.resources[cost.name] or 0) < (cost.amount * count)
      return true
    @gg_game_building_can_produce = (gg_sudo_name, count) =>
      gg_sudo = @gg_sudo_definition_for_name gg_sudo_name
      for cost in gg_sudo.consumes
        return false if (@gg_game.gg_mono[cost.name] or 0) < (cost.amount * count)
      return true

    @game_building_produce = (building_name, count) =>
      building = @building_definition_for_name building_name
      for cost in building.consumes
        @game.resources[cost.name] = @game.resources[cost.name] - (cost.amount * count)
      for product in building.produces
        @game.resources[product.name] = @game.resources[product.name] + product.amount
      return true
    @gg_game_gg_sudo_produce = (gg_sudo_name, count) =>
      gg_sudo = @gg_sudo_definition_for_name gg_sudo_name
      for cost in gg_sudo.consumes
        @gg_game.gg_mono[cost.name] = @gg_game.gg_mono[cost.name] - (cost.amount * count)
      for product in gg_sudo.produces
        @gg_game.resources[product.name] = @game.gg_mono[product.name] + product.amount
      return true

    @game_tick = () =>
      for building, count of @game.buildings
        if @game_building_can_produce building, count
          @game_building_produce building, count
    $interval @game_tick, 1000
    @gg_game_tick = () =>
      for gg_sudo, count of @gg_game.gg_sudo
        if @gg_game_gg_sudo_can_produce gg_sudo, count
          @game_gg_sudo_produce gg_sudo, count
    $interval @gg_game_tick, 1000


    @game_add_resource = (name) =>
      @game.resources[name] = (@game.resources[name] or 0) + 1

    @gg_game_add_gg_mono = (name) =>
      @game.gg_mono[name] = (@game.gg_mono[name] or 0) + 1


    @reset_game()
    @reset_gg_game()

    @

}
