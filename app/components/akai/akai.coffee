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
      console.log "Survay SAYS"
      console.log @log

    @log_value "logstarted"

    @gC = 100
#gC
    @add_gC = ->
      @gC = @gC + 15
#uL
    $interval ->
      vm.gC = vm.gC - 1
    , 1000
#uH
    $interval ->
      vm.gC = vm.gC - 25
    , 120000

#weight
    @weight = 120

    @add_weight = ->
      @weight = @weight + 2

    $interval ->
      vm.weight = vm.weight - .1
    , 1000

    $interval ->
      vm.weight = vm.weight - .5
    , 1200

    console.log @

    @


}
