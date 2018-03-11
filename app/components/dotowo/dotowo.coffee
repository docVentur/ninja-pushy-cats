angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'dotowo', {
  template: require('./dotowo.html.hamlc'),
  controller: ($http, $interval) ->
    vm = @

    @
}
