angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'soritia', {
  template: require('./soritia.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @


    @
}
