angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @feeling = -1
    @add_feeling = (amount) ->
      vm.feeling = vm.feeling + amount
      Materialize.toast 'Fed!!!', 4000
    @daegory = DaegoryFSM.init_daegory()
    vm.state = vm.daegory.__machina__.daegory.state


# probably unused
    @mass = 100

    @add_mass = ->
      @mass = @mass + 1
      Materialize.toast 'Fed!!!', 4000


#    $interval ->
#      DaegoryFSM.tick(vm.daegory)
#      vm.state = vm.daegory.__machina__.daegory.state
#    , 1000

    @
}
