angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'sudo', {
  template: require('./sudo.html.hamlc'),
  controller: ($http, $interval) ->
    vm = @

    @
}
