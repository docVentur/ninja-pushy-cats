angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryDiscovered', {
  template: require('./screenDaegoryDiscovered.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @add_mass = (amount) ->
      console.log("handling a discovered_diabetic tick")
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Daegs diabetes is discovered', 3333
    @
}
