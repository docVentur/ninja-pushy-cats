angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenTsugu', {
  template: require('./screenTsugu.html.hamlc'),
  bindings: {
    daegory: "<"
  },
  controller: (DaegoryFSM, $stateParams, moment, $interval) ->
    vm = @


    @
}
