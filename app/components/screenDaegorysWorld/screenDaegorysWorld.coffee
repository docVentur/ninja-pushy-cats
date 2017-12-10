angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegorysWorld', {
  template: require('./screenDaegorysWorld.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    @mass = 100
    @feeling = 0
    @minion = 1

    @add_mass = (amount) ->
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      vm.minion = vm.minion + amount
      Materialize.toast 'Fed!!!', 3333

    @


}
