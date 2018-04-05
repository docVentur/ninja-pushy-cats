angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'vCard', {
  template: require('./card.html.hamlc'),
  bindings: {
    value: "@"
  },
  controller: ($sce) ->
    @$onInit = ->
      syms = ['spades', 'hearts', 'clubs', 'diams', 'yin yang', 'peace symbol']
      vals = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
      card_no = parseInt(@value)
      cards_per_suit = vals.length
      @suit = syms[_.floor card_no / cards_per_suit]
      @card = vals[_.floor card_no % cards_per_suit]







    @
}
