angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'


app.component 'editorMaterials', {
  template: require('./materials.html.hamlc'),
  bindings: {
    material: '<',
    gg_sudo: '<',
    gg_mono: '<',
    type: '=',
    onUpdate: '&',
    onDelete: '&'
  },
  controller: ($http) ->
    vm = @

    @delete = () =>
      @onDelete {gg_sudo: @gg_sudo, material_name: @material_name, type: @type}

    @update = () =>
      @onUpdate {gg_sudo: @gg_sudo, material_name: @material_name, type: @type, amount: @amount}
      if @material.name == ""
        @material_name = @material.name
        @amount = @material.amount

    @$onInit = ->
      @material_name = @material.name
      @amount = @material.amount

    @
}
