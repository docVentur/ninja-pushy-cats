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





      @lookup_suit= {spades: "S", hearts: "H", clubs: "C", diams: "D", "yin yang": "Y", "peace symbol": "Z"}
      @lookup_suit_rank = {S: "1", H: "2", C: "3", D: "4", Y: "5", Z: "6"}


      @lookup_rank = {A: "0", K: "1", Q: "2", J: "3", 10: "4", 9: "5", 8: "6", 7: "7", 6: "8", 5: "9", 4: "10", 3: "11", 2: "12"}
      @lookup_rank_color = {0: "pink", 1: "yellow", 2: "orange", 3: "red", 4: "purple", 5: "blue", 6: "green", 7: "white", 8: "black", 9: "grey", 10: "pink", 11: "cyan", 12: "brown"}
      @lookup_rank_shade = {0: "accent-2", 1: "lighten-5", 2: "lighten-4", 3: "lighten-3", 4: "lighten-2", 5: "lighten-1", 6: "", 7: "darken-1", 8: "darken-2", 9: "darken-3", 10: "darken-4", 11: "darken-5", 12: ""}




    @
}
