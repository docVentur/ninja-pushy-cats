angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'aiLogType', {
  template: require('./aiLogType.html.hamlc'),
  bindings: {
    entry: "<"
  },
  controller: () ->
    vm = @
    console.log @entry



    @

}
