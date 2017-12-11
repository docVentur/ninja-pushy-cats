angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryGenki', {
  template: require('./screenDaegoryGenki.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @mass = 100
    @feeling = 0
    @minion = 1

    @add_mass = (amount) ->
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Daeg is GENKI!!!', 3333

    @
}
