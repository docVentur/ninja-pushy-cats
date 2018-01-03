angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'zDeck', {
  template: require('./zdeck.html.hamlc'),
  bindings: {
    value: "@"
  },
  controller: ($sce) ->
    vm = @

    @suits = ['spades', 'hearts', 'clubs', 'diams', 'yin yang', 'peace symbol']
    @ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    @num_cards = @suits.length * @ranks.length

    @deck = []
    @cards = []

    @get_card = (x, y) ->
      return vm.cards[(y * vm.ranks.length) + x]

    for s in [0...@suits.length]
      for r in @ranks
        @cards.push {suit: s, rank: r, symbol: "border_inner", color: "black", "background-color": "pink", "symbol-color": "white"}
        @deck.push (s*@ranks.length) + r

    for s in [0..@suits.length]
      card = @get_card s, 4
      card.symbol = "surround_sound"

    console.log @cards

    #@deck = _.shuffle @deck

    @
}
