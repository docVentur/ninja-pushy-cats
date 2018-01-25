angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.service 'zDeckService', ->
  vm = @

  @get_card = (x, y) ->
    return vm.cards[(y * vm.ranks.length) + x]

  @get_deck = ->
    _.map vm.cards, (c, i) -> i



  @suit_colors = ['yellow', 'orange', 'red', 'purple', 'blue', 'green', 'white', 'black', 'grey', 'pink', 'cyan', 'brown']
  @suit_text_colors = ['black', 'white', 'black', 'white', 'black', 'white', 'black', 'white', 'black', 'white', 'black', 'white']



  @suits = ['&spades;', '&hearts;', '&clubs;', '&diams;', '&#9775;', '&#9774;', '&#9818;', '&#9819;', '&#9820;', '&#9821;', '&#9822;', '&#9823;']
  @suit_symbols = ['&spades;', '&hearts;', '&clubs;', '&diams;', '&#9775;', '&#9774;', '&#9818;', '&#9819;', '&#9820;', '&#9821;', '&#9822;', '&#9823;']



  @ranks = ['A', 'K', 'Q', 'J', 10, 9, 8, 7, 6, 5, 4, 3, 2]
  @rank_shades = ["", "lighten-5", "lighten-4", "lighten-3", "lighten-2", "lighten-1", "", "darken-3", "darken-4", "accent-1", "accent-2", "accent-3", "accent-4"]



  @rank_icon = ["border_inner", "texture", "surround_sound", "toc", "share", "invert_colors", "open_with", "play_for_work", "fingerprint", "settings", "portrait"]
  @rank_colors = ["yellow", "orange", "red", "purple", "blue", "green", "white", "black", "grey", "pink", "cyan", "brown"]

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
    card.symbol = "accessibility"

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
    card['suit-color'] = "white-text"

    card = @get_card r, 3
    card['suit-color'] = "white-text"

    card = @get_card r, 5
    card['suit-color'] = "white-text"

    card = @get_card r, 7
    card['suit-color'] = "white-text"

    card = @get_card r, 9
    card['suit-color'] = "white-text"

    card = @get_card r, 11
    card['suit-color'] = "white-text"


  @
