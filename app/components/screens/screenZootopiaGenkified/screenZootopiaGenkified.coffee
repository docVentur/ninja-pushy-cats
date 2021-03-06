angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenZootopiaGenkified', {
  template: require('./screenZootopiaGenkified.html.hamlc'),
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



}
