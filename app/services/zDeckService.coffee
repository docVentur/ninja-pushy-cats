angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.service 'zDeckService', ->
  vm = @

  @get_card = (x, y) ->
    return vm.cards[(y * vm.ranks.length) + x]

  @get_deck = ->
    _.map vm.cards, (c, i) -> i
  
  @suits = ['spades', 'hearts', 'clubs', 'diams', 'yin yang', 'peace symbol']
  @suit_colors = ['green', 'blue', 'red', 'yellow', 'orange', 'purple']
  @suit_text_colors = ['yellow', 'white', 'green', 'black', 'black', 'green']

  @suit_symbols = ['&spades;', '&hearts;', '&clubs;', '&diams;', '&#9775;', '&#9774;']
  @ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
  @rank_shades = ["accent-2", "lighten-5", "accent-1", "lighten-3", "accent-2", "lighten-1", "", "darken-3", "darken-4", "accent-1", "accent-2", "accent-3", "accent-4"]

  @num_cards = @suits.length * @ranks.length

  @cards = []

  for s in [0...@suits.length]
    for r in [0...@ranks.length]
      @cards.push {
        suit: @suits[s],
        rank: @ranks[r],
        "rank-shade": "#{@suit_colors[s]} #{@suit_text_colors[s]}-text #{@rank_shades[r]}",
        symbol: "border_inner",
        color: "black",
        "background-color": "pink",
        "symbol-color": "white",
        "suit-symbol": @suit_symbols[s],
        "suit-color": "black-text"
      }

  for s in [0...@suits.length]
    card = @get_card 4, s
    card.symbol = "surround_sound"

  for r in [0...@ranks.length]
    card = @get_card r, 1
    card['suit-color'] = "red-text"

    card = @get_card r, 3
    card['suit-color'] = "red-text"

    card = @get_card r, 5
    card['suit-color'] = "red-text"

  @


