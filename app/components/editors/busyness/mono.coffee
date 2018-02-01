angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

#resources
# [{"name":"Catnip"},{"name":"Wood"}]
# buildings
# [{"name":"Farm","costs":[{"name":"Wood","amount":"5"}],"produces":[]}]
# game
# {"resources":{"Catnip":10,"Wood":5},"buildings":{"Farm":1}}

app.component 'editorMono', {
  template: require('./product.html.hamlc'),
  bindings: {
    material: '<',
    building: '<',
    resources: '<',
    type: '=',
    onUpdate: '&',
    onDelete: '&'
  },
  controller: ($http) ->
    vm = @

    @delete = () =>
      @onDelete {building: @building, material_name: @material_name, type: @type}

    @update = () =>
      @onUpdate {building: @building, material_name: @material_name, type: @type, amount: @amount}
      if @material.name == ""
        @material_name = @material.name
        @amount = @material.amount

    @$onInit = ->
      @material_name = @material.name
      @amount = @material.amount

    @
}
