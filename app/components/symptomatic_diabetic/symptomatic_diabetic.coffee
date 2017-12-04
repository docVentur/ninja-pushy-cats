angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'symptomaticdiabetic', {
  template: require('./symptomatic_diabetic.html.hamlc'),
}
