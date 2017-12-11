angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @mass = 100
    @feeling = 0
    @minion = 1

    @add_mass = (amount) ->
      console.log("handling a blissful tick")
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Fed!!!', 3333
    @
}
