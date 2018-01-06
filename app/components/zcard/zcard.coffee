angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'zCard', {
  template: require('./zcard.html.hamlc'),
  bindings: {
    card: "<"
  },
  controller: ($sce) ->
    vm = @

    @html5Entities = (value) ->
      value.replace /[\u00A0-\u9999<>\&\'\"]/gim, (i) ->
        "&##{ i.charCodeAt(0) };"

    @trustAsHtml = (value) ->
      $sce.trustAsHtml value

    @
}
