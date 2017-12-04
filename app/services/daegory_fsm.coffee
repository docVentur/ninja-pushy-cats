machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

daegory_fsm = {
  namespace: "daegory",
  initialState: "bliss",
  states: {
    bliss: {
      _onEnter: (stats) ->
        console.log "Entered the blissful state"
      'tick': (stats) ->
        console.log "Handle a blissful tick()"
        stats.number = stats.number + 25
        if stats.number > 100
          @transition stats, 'symptomatic_diabetic'
    },
    symptomatic_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the symptomatic_diabetic state"
      'tick': (stats) ->
        console.log "Handle a diabetic tick()"
        stats.number = stats.number + 25
        if stats.number > 200
          @transition stats, 'discovered_diabetic'

    },
    discovered_diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the discovered_diabetic state"
      'tick': (stats) ->
        console.log "Handle a diabetic tick()"
    }
  },

  init_daegory: () ->
    console.log "Making a new daegory"
    daegory = {number: 50}
    @handle daegory, 'tick'
    return daegory

  tick: (daegory) ->
    @handle daegory, 'tick'
}


app = angular.module 'AXE'

app.service 'DaegoryFSM', (pouchDB, moment) ->
  return new machina.BehavioralFsm daegory_fsm
