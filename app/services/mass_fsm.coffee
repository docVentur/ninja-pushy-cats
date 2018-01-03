machina = require('machina')
angular = require 'angular'
_ = require 'lodash'

Mass_fsm = {
  namespace: "Mass",
  initialState: "normal weight",
  states: {
    "underweight": {
      _onEnter: (stats) ->
        console.log "now underweight"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 18.5
          @transition stats, 'normal weight'
    }
    "normal weight": {
      _onEnter: (stats) ->
        console.log "now normal weight"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 25
          @transition stats, 'overweight'
        if stats.mass < 18.5
          @transition stats, 'underweight'
    }
    "overweight": {
      _onEnter: (stats) ->
        console.log "now overweight"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 30
          @transition stats, 'class I obesity'
        if stats.mass < 25
          @transition stats, 'normal weight'
    }
    "class I obesity": {
      _onEnter: (stats) ->
        console.log "now class I obese"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 35
          @transition stats, 'class II obesity'
        if stats.mass < 30
          @transition stats, 'overweight'
    }
    "class II obesity": {
      _onEnter: (stats) ->
        console.log "now class II obese"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 40
          @transition stats, 'class III obesity'
        if stats.mass < 35
          @transition stats, 'class I obesity'
    }
    "class III obesity":  {
      _onEnter: (stats) ->
        console.log "now class III obese"
      add_mass: (stats, value) ->
        stats.mass = stats.mass + value
        if stats.mass >= 2000
          @transition stats, 'impossible. talk to developer'
        if stats.mass < 40
          @transition stats, 'class II obesity'
    }

  },

  init_Mass: (fsm, value) ->
    console.log "mass_fsm init"
    fsm.mass = 0
    @handle fsm, 'add_mass', value
    return fsm

  add_mass: (fsm, amount) ->
    @handle fsm, 'add_mass', amount
}


app = angular.module 'GG'

app.service 'MassFSM', (moment) ->
  return new machina.BehavioralFsm Mass_fsm
