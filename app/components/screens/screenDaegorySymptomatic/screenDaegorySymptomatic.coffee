angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegorySymptomatic', {
  template: require('./screenDaegorySymptomatic.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @add_mass = (amount) ->
      console.log("handling a symptomatic_diabetic tick")
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass - amount
      vm.feeling = vm.feeling - amount
      Materialize.toast 'Fed!!!', 3333
    @
}
