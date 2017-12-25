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
      return '' if @daegory.__machina__.daegory.state=='bliss'
      return 'accent-3 grey-text diabetic' if @daegory.__machina__.daegory.state=='symptomatic_diabetic'
      return 'accent-2 grey-text' if @daegory.__machina__.daegory.state=='discovered_diabetic'
      return 'black-text' if @daegory.__machina__.daegory.state=='treated_diabetic'
      return 'lighten-2 pink-text' if @daegory.__machina__.daegory.state=='genki_diabetic'
      return 'darken-4 black-text' if @daegory.__machina__.daegory.state=='rip'
      return 'lighten-4 brown-text' if @daegory.__machina__.daegory.state=='tsugu'

    @font_class_for_state = () ->
      return 'bliss-font' if @daegory.__machina__.daegory.state=='bliss'
      return 'symptomatic-diabetic-font' if @daegory.__machina__.daegory.state=='symptomatic_diabetic'
      return 'discovered-diabetic-font' if @daegory.__machina__.daegory.state=='discovered_diabetic'
      return 'treated-diabetic-font' if @daegory.__machina__.daegory.state=='treated_diabetic'
      return 'genki-diabetic-font' if @daegory.__machina__.daegory.state=='genki_diabetic'
      return 'rip-font' if @daegory.__machina__.daegory.state=='rip'
      return 'tsugu-font' if @daegory.__machina__.daegory.state=='tsugu'

    @

}
