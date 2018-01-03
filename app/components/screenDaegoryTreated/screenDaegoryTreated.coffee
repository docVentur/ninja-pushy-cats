angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryTreated', {
  template: require('./screenDaegoryTreated.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @add_mass = (amount) ->
      console.log("handling a treated_diabetic tick")
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Daegory is treated!', 3333
    @
}
