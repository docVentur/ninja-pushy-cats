angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'tags', {
  template: require('./tags.html.hamlc'),
  controller: (AXEdb) ->
    vm = @

    @tags = []
    @new_tag_name = ''

    @update = ->
      AXEdb.tags().then (results) ->
        vm.tags = _.map results.rows, (v, i, r) -> v.doc

    @add_tag = ->
      AXEdb.post {name: vm.new_tag_name, record_type: 'tag'}
      vm.new_tag_name = ''
      @update()

    @update()

    @
}
