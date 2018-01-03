machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

feelings_fsm = {
  namespace: "feelings",
  initialState: "positive",
  states: {
    negx6: {
      _onEnter: (stats) ->
        console.log "now feeling neg*6"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -100
          @transition stats, 'impossible'
        if stats.mass > -80
          @transition stats, 'negx5'

}
    negx5: {
      _onEnter: (stats) ->
        console.log "now feeling neg*5"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -80
          @transition stats, 'negx6'
        if stats.mass > -60
          @transition stats, 'negx4'
}
    negx4: {
      _onEnter: (stats) ->
        console.log "now feeling neg*4"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -60
          @transition stats, 'negx5'
        if stats.mass > -40
          @transition stats, 'negx3'
}
    negx3: {
      _onEnter: (stats) ->
        console.log "now feeling neg*3"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -40
          @transition stats, 'negx4'
        if stats.mass > -20
          @transition stats, 'negx2'
}
    negx2: {
      _onEnter: (stats) ->
        console.log "now feeling neg*2"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -20
          @transition stats, 'negx3'
        if stats.mass > -10
          @transition stats, 'negative'

}
    negitive: {
      _onEnter: (stats) ->
        console.log "now feeling neg"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= -10
          @transition stats, 'negx2'
        if stats.mass > 0
          @transition stats, 'positive'

}
    positive: {
      _onEnter: (stats) ->
        console.log "now feeling positive"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= 0
          @transition stats, 'negitive'
        if stats.mass > 10
          @transition stats, 'posx2'
}
    posx2: {
      _onEnter: (stats) ->
        console.log "now feeling pos*2"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= 10
          @transition stats, 'positive'
        if stats.mass > 20
          @transition stats, 'posx3'
}
    posx3: {
      _onEnter: (stats) ->
        console.log "now feeling pos*3"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= 20
          @transition stats, 'posx2'
        if stats.mass > 40
          @transition stats, 'posx4'
}
    posx4: {
      _onEnter: (stats) ->
        console.log "now feeling pos*4"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= 40
          @transition stats, 'posx3'
        if stats.mass > 60
          @transition stats, 'posx5'
}
    posx5: {
      _onEnter: (stats) ->
        console.log "now feeling pos*5"
      add_feeling: (stats, value) ->
        stats.feeling = stats.feeling + value
        if stats.feelings <= 60
          @transition stats, 'posx4'
        if stats.mass > 80
          @transition stats, 'posx6'
}
    posx6: {
      _onEnter: (stats) ->
        console.log "now feeling pos*6"
      add_feeling: (stats, value) ->
        stats.number = stats.number + value
        if stats.feelings <= 80
          @transition stats, 'posx5'
        if stats.number > 100
          @transition stats, 'impossible'
    },

  },


  init_Feelings: (fsm, value) ->
    console.log "feelings_fsm init"
    fsm.feelings = 9
    @handle fsm, 'add_feeling', value
    return fsm

  add_feeling: (fsm, amount) ->
    @handle fsm, 'add_feeling', amount
}


app = angular.module 'GG'

app.service 'FeelingsFSM', (moment) ->
  return new machina.BehavioralFsm feelings_fsm
