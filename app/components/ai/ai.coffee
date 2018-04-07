angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'ai', {
  template: require('./ai.html.hamlc'),

  controller: (DaegoryFSM, MassFSM, FeelingsFSM, $stateParams, moment, $interval, zDeckService) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    @minion = 1
    MassFSM.init_Mass @daegory, 23
    FeelingsFSM.init_Feelings @daegory, 9
    console.log @daegory

    @cards = zDeckService.cards

    @ace_of_spades = zDeckService.get_card 0, 0

    @add_mass = () ->
      @mass = @mass + 1
    @add_feeling = () ->
      @feeling = @feeling + 1
    @add_minion = () ->
      @minion = @minion + .1

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
    @cards = zDeckService.cards
    @

}
