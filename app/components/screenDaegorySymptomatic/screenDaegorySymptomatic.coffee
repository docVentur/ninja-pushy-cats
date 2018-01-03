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

    @add_mass = (-1) ->
      console.log("handling a symptomatic_diabetic tick")
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + -1
      vm.feeling = vm.feeling + -5
      Materialize.toast 'Fed!!!', 3333
    @
}
