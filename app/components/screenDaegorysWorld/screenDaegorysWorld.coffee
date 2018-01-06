angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenDaegorysWorld', {
  template: require('./screenDaegorysWorld.html.hamlc'),
  controller: (DaegoryFSM, MassFSM, FeelingsFSM, $stateParams, moment, $interval) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    @minion = 1
    MassFSM.init_Mass @daegory, 23
    FeelingsFSM.init_Feelings @daegory, 9
    console.log @daegory

    @suits= ['spades', 'hearts', 'clubs', 'diams', 'yin yang', 'peace symbol']
    @lookup_suit= {spades: "S", hearts: "H", clubs: "C", diams: "D", "yin yang": "Y", "peace symbol": "Z"}
    @lookup_suit_rank = {S: "1", H: "2", C: "3", D: "4", Y: "5", Z: "6"}
    @lookup_rank_color = {0: "pink", 1: "yellow", 2: "orange", 3: "red", 4: "purple", 5: "blue", 6: "green", 7: "white", 8: "black", 9: "grey", 10: "pink", 11: "cyan", 12: "brown"}
    @lookup_rank_shade = {0: "accent-2", 1: "lighten-5", 2: "accent-1", 3: "lighten-3", 4: "accent-2", 5: "lighten-1", 6: "", 7: "darken-3", 8: "darken-4", 9: "accent-1", 10: "accent-2", 11: "accent-3", 12: "accent-4"}
    @lookup_rank_icon = {0: "accessibility", 1: "3d_rotation", 2: "texture", 3: "surround_sound", 4: "toc", 5: "group_work", 6: "find_replace", 7: "invert_colors", 8: "open_with", 9: "playlist_add", 10: "fingerprint", 11: "settings", 12: "portrait"}

    @add_mass = () ->
      @mass = @mass + 1
    @add_feeling = () ->
      @feeling = @feeling + 1
    @add_minion = () ->
      @minion = @minion + .1

    @get_card_classes = (suit, card) ->
      classes = "#{vm.lookup_rank_color[card]} #{vm.lookup_rank_color[card]}"
    @tick_it = () ->
      DaegoryFSM.tick(vm.daegory)
    @class_for_state = () ->
      return '' if @daegory.__machina__.daegory.state=='bliss'
      return 'accent-3 grey-text diabetic' if @daegory.__machina__.daegory.state=='symptomatic_diabetic'
      return 'accent-2 grey-text' if @daegory.__machina__.daegory.state=='discovered_diabetic'
      return 'black-text' if @daegory.__machina__.daegory.state=='treated_diabetic'
      return 'lighten-2 pink-text' if @daegory.__machina__.daegory.state=='genki_diabetic'
      return 'darken-4 black-text' if @daegory.__machina__.daegory.state=='rip'
      return 'lighten-4 brown-text' if @daegory.__machina__.daegory.state=='tsugu'

    @font_class_for_state = () ->
      return 'bliss-font' if @daegory.__machina__.daegory.state=='bliss'
      return 'symptomatic-diabetic-font' if @daegory.__machina__.daegory.state=='symptomatic_diabetic'
      return 'discovered-diabetic-font' if @daegory.__machina__.daegory.state=='discovered_diabetic'
      return 'treated-diabetic-font' if @daegory.__machina__.daegory.state=='treated_diabetic'
      return 'genki-diabetic-font' if @daegory.__machina__.daegory.state=='genki_diabetic'
      return 'rip-font' if @daegory.__machina__.daegory.state=='rip'
      return 'tsugu-font' if @daegory.__machina__.daegory.state=='tsugu'



    @

}
