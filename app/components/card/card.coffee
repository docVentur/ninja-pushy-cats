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
      syms = ['spades', 'hearts', 'clubs', 'diams']
      vals = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
      card_no = parseInt(@value)

      @suit = syms[_.floor card_no / 13]
      @card = vals[_.floor card_no % 13]

    @
}
