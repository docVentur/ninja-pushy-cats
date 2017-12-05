angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'symptomaticdiabetic', {
  template: require('./symptomatic_diabetic.html.hamlc'),

  controller: (DaegoryFSM) ->
    vm = @
    @add_mass = ->
      console.log "some message"
      DaegoryFSM.tick(vm.daegory)
    @loadMatch = ->
      require "./greyscale_match.jpg"

    @
    

}
