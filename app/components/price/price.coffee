angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'price', {
  template: require('./price.html.hamlc'),
  bindings: { amount: '<' }
}
