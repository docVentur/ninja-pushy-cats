angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'murasaki', {
  template: require('./murasaki.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    @daegory = DaegoryFSM.init_daegory()
    vm.state = vm.daegory.__machina__.daegory.state

#    $interval ->
#      DaegoryFSM.tick(vm.daegory)
#      vm.state = vm.daegory.__machina__.daegory.state
#    , 1000

    @
}
