angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLog', {
  template: require('./aiLog.html.hamlc'),
  controller: (aiFSM, zDeckService) ->
    vm = @
    @ai = aiLogFSM.init_ai()
    @minion = 1
    console.log @ai

    @cards = zDeckService.cards

    @add_BG = () ->
      @aiBG = @aiBG + 0
    @add_uLong = () ->
      @aiULong = @aiULong + 0
    @add_uShort = () ->
      @aiUShort = @aiShort + 0

    @tick_it = () ->
      aiLogFSM.tick(vm.ai)

    @cards = zDeckService.cards


    @

}
