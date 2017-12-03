angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'akai', {
  template: require('./akai.html.hamlc'),
  controller: (AXEdb, $stateParams, moment, $interval) ->
    vm = @
    @log = []
    @log_value = (value) ->
      @log.push {when: moment(), value: value}
      console.log "Survey SAYS"
      console.log @log

    @log_value "logstarted"

#mass
    @mass = 100

    @add_mass = ->
      @mass = @mass + 1
      Materialize.toast 'Fed!!!', 4000

#gC
    @gC = 100

    @add_gC = ->
      @gC = @gC + 15

#uL shouldn't apply to mass, right?
    $interval ->
      vm.mass = vm.mass - 1
    , 1000

#uH
    $interval ->
      vm.gC = vm.gC - 25
    , 120000

#getting replaced by #mass
#weight
    @weight = 120

    @add_weight = ->
      @weight = @weight + @new_entry_amount
      @log_value "added 2"
      @log_value "value #{@new_entry_amount}"


    $interval ->
      vm.weight = vm.weight - .1
    , 1000

    $interval ->
      vm.weight = vm.weight - .5
    , 1200

    console.log @

    @


}
