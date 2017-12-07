machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

daegory_fsm = {
  namespace: "daegory",
  initialState: "symptomatic_diabetic",
  states: {
    bliss: {
      _onEnter: (stats) ->
        console.log "Entered the bliss state. Think greyscale_iceberg. Use widget_feeding."
      'tick': (stats) ->
        console.log "Handle a blissful tick()"
        stats.number = stats.number + 1
        if stats.number > 100
          @transition stats, 'symptomatic_diabetic'
    },
    symptomatic_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the symptomatic_diabetic state. Think greyscale_match. Use widget_feeling."
      'tick': (stats) ->
        console.log "Handle a diabetic tick()"
        stats.number = stats.number + 1
        if stats.number > 200
          @transition stats, 'discovered_diabetic'
    },
    discovered_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the discovered_diabetic state. Think greyscale_hands. Use widget_fellowshipping."
      'tick': (stats) ->
        console.log "Handle a diabetic tick()"
    }
    treated_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the treated_diabetic state. Think yellow_fairygodmother. Use widget_fairy_gawdhordes"
    }

  },

  init_daegory: () ->
    console.log "Making a new Daegory Gene"
    daegory = {number: 0}
    @handle daegory, 'tick'
    return daegory

  tick: (daegory) ->
    @handle daegory, 'tick'
}


app = angular.module 'AXE'

app.service 'DaegoryFSM', (pouchDB, moment) ->
  return new machina.BehavioralFsm daegory_fsm
