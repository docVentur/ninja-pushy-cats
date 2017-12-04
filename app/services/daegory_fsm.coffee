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
        @transition stats, 'diabetic'
    },
    diabetic: {
      _onEnter: (stats) ->
        console.log "Entered the diabetic state"
      'tick': (stats) ->
        console.log "Handle a diabetic tick()"
    }
  },

  init_daegory: () ->
    console.log "Making a new daegory"
    daegory = {}
    @handle daegory, 'tick'
    return daegory

  tick: (daegory) ->
    @handle daegory, 'tick'
}


app = angular.module 'AXE'

app.service 'DaegoryFSM', (pouchDB, moment) ->
  return new machina.BehavioralFsm daegory_fsm
