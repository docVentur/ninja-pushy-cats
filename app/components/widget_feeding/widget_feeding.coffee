angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'widget_feeding', {
  template: require('./widget_feeding.html.hamlc'),
  bindings: {
    value: '<'
  }
}
