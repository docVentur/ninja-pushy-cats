angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenMain', {
  template: require('./screenMain.html.hamlc'),
  controller: (DaegoryFSM, MassFSM, FeelingsFSM, $stateParams, moment, $interval, zDeckService) ->
    vm = @

    @screens = {'aigg': false, 'daegorysWorld': false, 'zootopiaGenkified': false}

    @toggle_screen = (screen) =>
      @screens[screen] = !@screens[screen]

    @cards = zDeckService.cards

    @ace_of_spades = zDeckService.get_card 0, 0










    @

}
