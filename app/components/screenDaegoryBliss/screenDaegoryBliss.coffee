angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @add_mass = (amount) ->
      vm.mass = vm.mass + amount
      vm.state = vm.daegory.__machina__.daegory.state
      Materialize.toast 'Well Fed!!!', 3333

    @


}
