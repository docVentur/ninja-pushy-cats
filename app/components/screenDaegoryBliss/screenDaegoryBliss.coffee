angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

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
