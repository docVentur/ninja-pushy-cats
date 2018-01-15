angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLog', {
  template: require('./aiLog.html.hamlc'),
  controller: ($http) ->
    vm = @

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


    @log_entries = []

    request = $http {url: "http://ai.gdkp.org/mobile/log_entries.json", method: 'GET'}
    request.then (r) ->
      console.log r.data
      vm.log_entries = _.compact r.data
    , (e) ->
      console.log e

    @

}
