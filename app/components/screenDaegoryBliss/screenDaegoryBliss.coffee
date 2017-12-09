angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegoryBliss', {
  template: require('./screenDaegoryBliss.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @
    @feelings = -1
    @add_feelings = (amount) ->
      vm.feelings = vm.feelings + amount
    @daegory = DaegoryFSM.init_daegory()
    vm.state = vm.daegory.__machina__.daegory.state

#    $interval ->
#      DaegoryFSM.tick(vm.daegory)
#      vm.state = vm.daegory.__machina__.daegory.state
#    , 1000

    @
}
