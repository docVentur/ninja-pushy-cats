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
  controller: ($http) ->
    vm = @

    @materialUpdate = (building, material, type) =>
      console.log "got update for "
      console.log building
      console.log material
      console.log type

    @materialRemove = () =>
      false

    @new_resource_name = ''
    @resources = [{"name":"Catnip"},{"name":"Wood"}]

    @new_building_name = ''
    @buildings = [{"name":"House","costs":[{"name":"Wood","amount":5}],"produces":[],"consumes":[]}]

    @new_building_cost = 0
    @new_building_produces = 0

    @add_cost_resource = 0
    @add_cost_amount = 0

    @mode = 'resources'

    @set_mode = (mode) ->
      @mode = mode

    @add_resource = () =>
      @resources.push {name: @new_resource_name}
      @new_resource_name = ''

    @add_building = () =>
      @buildings.push {name: @new_building_name, costs: [], produces: [], consumes: []}

    @add_building_cost = (building) =>
      building.costs.push {name: @add_cost_resource, amount: @add_cost_amount}

    @reset_game = () =>
      console.log @
      @game = {resources: {}, buildings: {}}

    @game_add_resource = (name) =>
      @game.resources[name] = (@game.resources[name] or 0) + 1

    @game_can_buy_building = (name) =>
      for building in @buildings
        if building.name == name
          for cost in building.costs
            return false if (@game.resources[cost.name] or 0) < cost.amount
          return true

    @game_buy_building = (name) =>
      return unless @game_can_buy_building(name)
      for building in @buildings
        if building.name == name
          for cost in building.costs
            @game.resources[cost.name] = @game.resources[cost.name] - cost.amount
          @game.buildings[building.name] = (@game.buildings[building.name] or 0) + 1

    @reset_game()

    @

}
