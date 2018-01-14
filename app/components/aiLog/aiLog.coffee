angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLog', {
  template: require('./aiLog.html.hamlc'),
  controller: (zDeckService, $http) ->
    vm = @

    console.log @ai

    @cards = zDeckService.cards

    @log_types=[
      {id:1, name: "Y", description: "yellow", bgcolor: "YELLOW", textcolor: "BLACK"},
      {id:2, name: "O", description: "orange", bgcolor: "ORANGE", textcolor: "BLACK"},
      {id:3, name: "R", description: "red", bgcolor: "RED", textcolor: "BLACK"},
      {id:4, name: "P", description: "purple", bgcolor: "PURPLE", textcolor: "BLACK"},
      {id:5, name: "B", description: "blue", bgcolor: "BLUE", textcolor: "BLACK"},
      {id:6, name: "G", description: "green", bgcolor: "GREEN", textcolor: "BLACK"},
      {id:7, name: "W", description: "white", bgcolor: "WHITE", textcolor: "BLACK"},
      {id:8, name: "L", description: "black", bgcolor: "BLACK", textcolor: "WHITE"},
      {id:9, name: "E", description: "grey", bgcolor: "GREY", textcolor: "BLACK"},
      {id:10, name: "I", description: "pink", bgcolor: "PINK", textcolor: "BLACK"},
      {id:11, name: "C", description: "cyan", bgcolor: "CYAN", textcolor: "BLACK"},
      {id:12, name: "N", description: "brown", bgcolor: "BROWN", textcolor: "BLACK"},
      {id:13, name: "ACE", description: "ace", bgcolor: "PINK", textcolor: "BLACK"},
      {id:14, name: "JKR", description: "joker", bgcolor: "GREY", textcolor: "WHITE"},
      {id:15, name: "BOX", description: "box", bgcolor: "BROWN", textcolor: "BLACK"},
    ]

    @log_muchnesss=[
      {id:1, name: "Y", description: "lighten-5", modify: "lighten-5"},
      {id:2, name: "O", description: "lighten-4", },
      {id:3, name: "R", description: "lighten-3", },
      {id:4, name: "P", description: "lighten-2", },
      {id:5, name: "B", description: "lighten-1", },
      {id:6, name: "G", description: "", },
      {id:7, name: "W", description: "darken-1", },
      {id:8, name: "L", description: "darken-2", },
      {id:9, name: "E", description: "darken-3", },
      {id:10, name: "I", description: "darken-4", },
      {id:11, name: "C", description: "accent-1", },
      {id:12, name: "N", description: "accent-2", },
      {id:13, name: "ACE", description: "accent-3", },
      {id:14, name: "JKR", description: "accent-4", },
      {id:15, name: "BOX", description: "", style: ""},
    ]

    @fake_log_entries=[
      {id:1, log_date: "01/13/18 at 5:11 PM", log_type: 1, log_value: "100"},
      {id:2, log_date: "01/13/18 at 5:11 PM", log_type: 2, log_value: "99"},
      {id:3, log_date: "01/13/18 at 5:11 PM", log_type: 3, log_value: "251"},
      {id:4, log_date: "01/13/18 at 5:11 PM", log_type: 4, log_value: "74"},
      {id:5, log_date: "01/13/18 at 5:11 PM", log_type: 5, log_value: "81"},
      {id:6, log_date: "01/13/18 at 5:11 PM", log_type: 6, log_value: "152"},
      {id:7, log_date: "01/13/18 at 5:11 PM", log_type: 7, log_value: "110"},
      {id:8, log_date: "01/13/18 at 5:11 PM", log_type: 8, log_value: "95"},
      {id:9, log_date: "01/13/18 at 5:11 PM", log_type: 9, log_value: "105"},
      {id:10, log_date: "01/13/18 at 5:11 PM", log_type: 10, log_value: "97"},
      {id:11, log_date: "01/13/18 at 5:11 PM", log_type: 11, log_value: "99"},
      {id:12, log_date: "01/13/18 at 5:11 PM", log_type: 12, log_value: "101"},
      {id:13, log_date: "01/13/18 at 5:11 PM", log_type: 13, log_value: "100"},
    ]

    @log_entries = []

    request = $http {url: "http://ai.gdkp.org/mobile/log_entries.json", method: 'GET'}
    request.then (r) ->
      console.log r.data
      vm.log_entries = _.compact r.data
    , (e) ->
      console.log e

    @

}
