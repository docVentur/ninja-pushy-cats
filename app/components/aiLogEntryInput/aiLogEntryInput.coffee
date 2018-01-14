angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLogEntryInput', {
  template: require('./aiLogEntryInput.html.hamlc'),
  controller: (zDeckService) ->
    vm = @
    console.log @ai



    @

}
