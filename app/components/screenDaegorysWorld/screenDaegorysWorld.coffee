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

    @tick_it = () ->
      DaegoryFSM.tick(vm.daegory)
    @class_for_state = () ->
      return 'accent-3 black-text' if @daegory.__machina__.daegory.state=='bliss'
      return 'accent-2' if @daegory.__machina__.daegory.state=='symptomatic_diabetic'
      return 'accent-1' if @daegory.__machina__.daegory.state=='discovered_diabetic'
      return '' if @daegory.__machina__.daegory.state=='treated_diabetic'
      return 'lighten-2' if @daegory.__machina__.daegory.state=='genki_diabetic'
      return 'lighten-5' if @daegory.__machina__.daegory.state=='rip'
      return '' if @daegory.__machina__.daegory.state=='daegorys_world_2'
    @class_for_

    @

}
