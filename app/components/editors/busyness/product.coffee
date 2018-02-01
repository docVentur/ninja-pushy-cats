angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

#resources
# [{"name":"Catnip"},{"name":"Wood"}]
# buildings
# [{"name":"Farm","costs":[{"name":"Wood","amount":"5"}],"produces":[]}]
# game
# {"resources":{"Catnip":10,"Wood":5},"buildings":{"Farm":1}}

app.component 'editorBusyness', {
  template: require('./busyness.html.hamlc'),
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

    @buildings = [{"name":"content_copy","costs":[{"name":"attachment","amount":1}],"produces":[{"name":"attachment","amount":30}],"consumes":[{"name":"attachment","amount":1}]};{"name":"developer_board","costs":[{"name":"photo","amount":1}],"produces":[{"name":"photo","amount":5}],"consumes":[{"name":"photo","amount":1}]};{"name":"business","costs":[{"name":"map","amount":1}],"produces":[{"name":"map","amount":5}],"consumes":[{"name":"attachment","amount":10}]}]

    @mode = 'game'

    @new_resource_name = ''
    @new_building_name = ''

    @add_resource = () =>
      @resources.push {name: @new_resource_name}
      @new_resource_name = ''

    @add_building = () =>
      @buildings.push {name: @new_building_name, costs: [], produces: [], consumes: []}
      @new_building_name = ''


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

    @building_definition_for_name = (building_name) =>
      for building in @buildings
        return building if building.name == building_name

    @game_building_can_produce = (building_name, count) =>
      building = @building_definition_for_name building_name
      for cost in building.consumes
        return false if (@game.resources[cost.name] or 0) < (cost.amount * count)
      return true

    @game_building_produce = (building_name, count) =>
      building = @building_definition_for_name building_name
      for cost in building.consumes
        @game.resources[cost.name] = @game.resources[cost.name] - (cost.amount * count)
      for product in building.produces
        @game.resources[product.name] = @game.resources[product.name] + product.amount
      return true


    @game_tick = () =>
      for building, count of @game.buildings
        if @game_building_can_produce building, count
          @game_building_produce building, count

    $interval @game_tick, 1000

    @game_add_resource = (name) =>
      @game.resources[name] = (@game.resources[name] or 0) + 1

    @reset_game()

    @

}
