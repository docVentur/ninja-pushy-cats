angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'discovereddiabetic', {
  template: require('./discovered_diabetic.html.hamlc'),
}
