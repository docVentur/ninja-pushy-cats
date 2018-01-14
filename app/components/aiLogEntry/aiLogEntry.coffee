angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLogEntry', {
  template: require('./aiLogEntry.html.hamlc'),
  bindings: {
    entry: "<"
  },
  controller: () ->
    vm = @
    console.log @entry



    @

}
