angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'tsugu', {
  template: require('./tsugu.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state) ->
    vm = @
    @colors = ["yellow", "orange", "red", "purple", "blue", "green", "white", "black", "grey", "pink"]
    numbers = [0..9]
    @grid = []
    for y in numbers
      row = []
      for x in numbers
        row.push {icon: "attachment", color: @colors[y]}
      @grid.push row
    @counter = 0
    @progress_timer = =>
      for row in @grid
        for cell in row
          if not cell.completed
            cell.completed = true
            cell.color = "blue-grey"
            @counter = @counter + 1
            return

    @grid_user_input = (x,y) =>
      console.log "user clicked #{x}, #{y}"
    $interval @progress_timer, 3000


    @

}
