angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'widgetFeeding', {
  template: require('./widget_feeding.html.hamlc'),
  bindings: {
    value: '<'
  }
}
