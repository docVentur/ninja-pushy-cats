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
  @suit_colors = ['yellow', 'orange', 'red', 'purple', 'blue', 'green']
  @suit_text_colors = ['black', 'red', 'black', 'red', 'black', 'red']

  @suit_symbols = ['&spades;', '&hearts;', '&clubs;', '&diams;', '&#9775;', '&#9774;']
  @ranks = ['A', 'K', 'Q', 'J', 10, 9, 8, 7, 6, 5, 4, 3, 2]
  @rank_shades = ["accent-2", "lighten-5", "accent-1", "lighten-3", "accent-2", "lighten-1", "", "darken-3", "darken-4", "accent-1", "accent-2", "accent-3", "accent-4"]
  @rank_icon = ["border_inner", "texture", "surround_sound", "toc", "share", "invert_colors", "open_with", "play_for_work", "fingerprint", "settings", "portrait"]
  @rank_colors = ["yellow", "orange", "red", "purple", "blue", "green", "white", "grey", "pink", "cyan", "brown"]
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
    card = @get_card 0, s
    card.symbol = "blur_on"

    card = @get_card 1, s
    card.symbol = "border_inner"

    card = @get_card 2, s
    card.symbol = "texture"

    card = @get_card 3, s
    card.symbol = "surround_sound"

    card = @get_card 4, s
    card.symbol = "toc"

    card = @get_card 5, s
    card.symbol = "share"

    card = @get_card 6, s
    card.symbol = "surround_sound"

    card = @get_card 7, s
    card.symbol = "surround_sound"

    card = @get_card 8, s
    card.symbol = "surround_sound"

    card = @get_card 9, s
    card.symbol = "surround_sound"

    card = @get_card 10, s
    card.symbol = "surround_sound"

    card = @get_card 11, s
    card.symbol = "surround_sound"

    card = @get_card 12, s
    card.symbol = "surround_sound"

  for r in [0...@ranks.length]
    card = @get_card r, 1
    card['suit-color'] = "purple-text"

    card = @get_card r, 3
    card['suit-color'] = "white-text"

    card = @get_card r, 5
    card['suit-color'] = "white-text"

  @
