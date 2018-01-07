angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'zDeck', {
  template: require('./zdeck.html.hamlc'),
  bindings: {
    value: "@"
  },
  controller: (zDeckService) ->
    vm = @

    @hand = []
    @deck = zDeckService.get_deck()
    @cards = zDeckService.cards
    @deck = _.shuffle @deck

    @hit_me = ->
      vm.hand.push vm.deck.pop()

    for i in [0..7]
      @hit_me()

    @
}
