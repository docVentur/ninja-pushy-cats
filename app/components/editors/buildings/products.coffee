angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

#resources
# [{"name":"Catnip"},{"name":"Wood"}]
# buildings
# [{"name":"Farm","costs":[{"name":"Wood","amount":"5"}],"produces":[]}]
# game
# {"resources":{"Catnip":10,"Wood":5},"buildings":{"Farm":1}}

app.component 'editorProduction', {
  template: require('./products.html.hamlc'),
  bindings: {
    material: '<',
    building: '<',
    resources: '<',
    type: '=',
    materialUpdate: '&',
    materialRemove: '&'
  },
  controller: ($http) ->
    vm = @

    @$onInit = ->
      console.log @material
      console.log @product

    @
}
