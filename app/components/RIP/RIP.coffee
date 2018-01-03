angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'rip', {
  template: require('./RIP.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @add_mass = (amount) ->
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'RIP Daegory Gene', 3333

    @
}
