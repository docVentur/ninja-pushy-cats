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

    @updateMaterial = (building, material_name, type, amount) =>
      console.log "got update for "
      console.log building
      console.log material_name
      console.log type
      console.log amount
      idx = _.findIndex building[type], (a) -> a.name == material_name
      if idx >= 0
        building[type][idx].amount = amount
      else
        building[type].push {name: material_name, amount: amount}

    @deleteMaterial = (building, material_name, type) =>
      console.log "got delete for "
      console.log building
      console.log material
      console.log type
      idx = _.findIndex building[type] (a) -> a.name == material_name
      if idx >= 0
        building[type].splice idx, 1

    @resources = [{"name":"Catnip"},{"name":"Wood"}]

    @buildings = [{"name":"House","costs":[{"name":"Wood","amount":5}],"produces":[],"consumes":[]}]

    @mode = 'resources'

    @set_mode = (mode) ->
      @mode = mode

    @reset_game = () =>
      console.log @
      @game = {resources: {}, buildings: {}}

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
