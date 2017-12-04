angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'bliss', {
  template: require('./bliss.html.hamlc'),
  bindings: {
    daegory: "<"
  }
  controller: (DaegoryFSM) ->
    vm = @
    @add_mass = ->
      console.log "some message"
      DaegoryFSM.tick(vm.daegory)
    @
}
