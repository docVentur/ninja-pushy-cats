angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'smilemeter', {
  template: require('./smilemeter.html.hamlc'),
  bindings: {
    value: '<'
  }
}
