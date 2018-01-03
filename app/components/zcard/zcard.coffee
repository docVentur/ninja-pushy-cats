angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'zCard', {
  template: require('./zcard.html.hamlc'),
  bindings: {
    card: "<"
  },
}
