angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'akai', {
  template: require('./akai.html.hamlc'),
  controller: (AXEdb, $stateParams, moment, $interval) ->
    vm = @

    @number = 100

    @add_number = ->
      @number = @number + 15

    $interval ->
      vm.number = vm.number - 1
    , 1000
    @
}
