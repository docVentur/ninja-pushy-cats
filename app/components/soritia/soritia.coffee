angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'soritia', {
  template: require('./soritia.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @

    NUM_CARDS = 13 * 6
    @deck = [0..NUM_CARDS]
    @deck = _.shuffle @deck

    @hand = []

    for i in [0..7]
      @hand.push @deck.pop()


    @points = [0..12]
    for point in @points
      @points[point]= point + 1
    @points[0]= 11
    @points[10]= 10
    @points[11]= 10
    @points[12]= 10

    @hit_me = ->
      vm.hand.push vm.deck.pop()

    @calculate_speed=->
      vm.score = 0
      for card in vm.hand
        vm.score = vm.score + vm.points[card]

    @
}
