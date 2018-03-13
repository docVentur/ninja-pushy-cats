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
    @colors = ["yellow", "orange", "red", "purple", "blue", "green", "white", "black", "grey", "pink", "cyan", "brown"]
    numbers = [0..23]
    @grid = []
    for y in numbers
      row = []
      for x in numbers
        row.push {icon: "attachment", color: @colors[y], x: x, y: y, frame_a:"", frame_b:""}
      @grid.push row
    @counter = 0
    @current_frame = "frame_a"
    @progress_timer = =>
      for row in @grid
        for cell in row
          if not cell.completed
            cell.completed = true
            cell.color = "blue-grey"
            console.log "processed #{cell.x}, #{cell.y}"

            @counter = @counter + 1
            return
    @click_circle = {"": "conductor", "conductor": "head", "head": "tail", "tail": ""}
    @grid_user_input = (y, x) =>
      console.log "user clicked #{x}, #{y}"
      @grid[y][x].color = "teal"
      @grid[y][x][@next_frame] = @click_circle[@grid[y][x][@next_frame]]
    @cell_should_be_electron = (cell) =>
      num_heads = 0
      if @grid[cell.y-1][cell.x-1][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y-1][cell.x][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y-1][cell.x+1][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y][cell.x-1][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y][cell.x+1][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y+1][cell.x-1][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y+1][cell.x][@current_frame] == "head"
        num_heads = num_heads + 1
      if @grid[cell.y+1][cell.x+1][@current_frame] == "head"
        num_heads = num_heads + 1
      if num_heads == 1
        return true
      if num_heads == 2
        return true

      return false
    @calculate_wire_world = =>
      if @current_frame == "frame_a"
        @current_frame = "frame_b"
        @next_frame = "frame_a"
      else
        @current_frame = "frame_a"
        @next_frame = "frame_b"

      for row in @grid
        for cell in row
          cell[@next_frame] = cell[@current_frame]
          if cell[@current_frame] == "head"
            cell[@next_frame] = "tail"
          if cell[@current_frame] == "tail"
            cell[@next_frame] = "conductor"
          if cell[@current_frame] == "conductor"
            if @cell_should_be_electron(cell)
              cell[@next_frame] = "head"


    $interval @progress_timer, 1000
    $interval @calculate_wire_world, 1000

    @

}
