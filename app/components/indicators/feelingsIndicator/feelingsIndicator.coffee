angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'feelingsIndicator', {
  template: require('./feelingsIndicator.html.hamlc'),
  bindings: {
    value: "<"
  }
}
