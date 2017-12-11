angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    vm.state = vm.daegory.__machina__.daegory.state
    @mass = 100
    @feeling = 0
    @minion = 1

    @add_mass = (amount) ->
      DaegoryFSM.tick(vm.daegory)
      DaegoryFSM.tick(vm.daegory)
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Fed!!!', 3333

    @
}
