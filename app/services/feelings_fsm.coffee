machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

feelings_fsm = {
  namespace: "feelings",
  initialState: "bliss",
  states: {
    neutral: {
      _onEnter: (stats) ->
        console.log "Entered a state of bliss. *Think greyscale_iceberg. Use widget_feeding*."
      'tick': (stats) ->
        console.log "Handle a bliss tick()"
        stats.number = stats.number + 1
        if stats.number > 10
          @transition stats, 'symptomatic_diabetic'
    },

  },

  tick: (daegory) ->
    @handle daegory, 'tick'
}


app = angular.module 'GG'

app.service 'FeelingsFSM', (moment) ->
  return new machina.BehavioralFsm feelings_fsm
