angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegorysWorld', {
  template: require('./screenDaegorysWorld.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    @mass = 1
    @feeling = -1
    @minion = 1

    @add_mass = (amount) ->
      vm.mass = vm.mass + amount
      vm.feeling = vm.feeling + amount
      vm.minion = vm.minion + amount
      Materialize.toast 'Fed!!!', 3333

    @add_feeling = (amount) ->
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Daegory loses mass and feels bad.', 3333

    @add_minion = (amount) ->
      vm.minion = vm.minion + amount
      Materialize.toast 'Daegory gets to live!!!', 3333

    @


}
