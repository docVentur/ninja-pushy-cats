angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenGGpA', {
  template: require('./screenGGpA.html.hamlc'),
  controller: (DaegoryFSM, MassFSM, FeelingsFSM, $stateParams, moment, $interval, zDeckService) ->
    vm = @

    @screens = {'editorBuildings': true}

    @toggle_screen = (screen) =>
      @screens[screen] = !@screens[screen]

    @cards = zDeckService.cards

    @ace_of_spades = zDeckService.get_card 0, 0










    @

}
