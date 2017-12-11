machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

daegory_fsm = {
  namespace: "daegory",
  initialState: "daegorys_world",
  states: {
    daegorys_world: {
      _onEnter: (stats) ->
        console.log "Entered Daegory Gene's World"
      'tick': (stats) ->
        console.log "Handle Daegory's tick()"
        stats.number = stats.number + 1
        if stats.number > 1
          @transition stats, 'bliss'
    },
    bliss: {
      _onEnter: (stats) ->
        console.log "Entered a state of bliss. *Think greyscale_iceberg. Use widget_feeding*."
      'tick': (stats) ->
        console.log "Handle a bliss tick()"
        stats.number = stats.number + 1
        if stats.number > 100
          @transition stats, 'symptomatic_diabetic'
    },
    symptomatic_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the symptomatic_diabetic state. *Think greyscale_match. Use widget_feeling.*"
      'tick': (stats) ->
        console.log "Handle a symptomatic_diabetic tick()"
        stats.number = stats.number + 1
        if stats.number > 200
          @transition stats, 'discovered_diabetic'
    },
    discovered_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the discovered_diabetic state. *Think greyscale_hands. Use widget_fellowshipping.*"
      'tick': (stats) ->
        console.log "Handle a discovered_diabetic tick()"
        stats.number = stats.number + 1
        if stats.number > 300
          @transition stats, 'treated_diabetic'
    }
    treated_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the treated_diabetic state. *Think yellow_fairygodmother. Use widget_fairy_gawdhordes.*"
      'tick': (stats) ->
        console.log "Handle a treated_diabetic tick()"
        stats.number = stats.number + 1
        if stats.number > 900
          @transition stats, 'genki_diabetic'
    }
    genki_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the genki_diabetic state. *Think 2020-30.*"
      'tick': (stats) ->
        console.log "Handle a genki_diabetic tick()"
        stats.number = stats.number + 1
        if stats.number > 1000
          @transition stats, 'RIP.DaegoryGene'
    }

  },

  init_daegory: () ->
    console.log "Atarashii Daegory Gene"
    daegory = {number: 0}
    @handle daegory, 'tick'
    return daegory

  tick: (daegory) ->
    @handle daegory, 'tick'
}


app = angular.module 'GG'

app.service 'DaegoryFSM', (moment) ->
  return new machina.BehavioralFsm daegory_fsm
