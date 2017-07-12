angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'daidaiiro', {
  template: require('./daidaiiro.html.hamlc'),
  controller: (AXEdb, $stateParams, moment) ->
    vm = @
    db = AXEdb.db

    @tags = []
    @entries = []

    AXEdb.tags()
      .then (results) ->
        vm.tags = _.map results.rows, (v, i, r) -> v.doc


    @new_entry = ->
      return {
        pennies: 0,
        tags: {},
        comment: '',
        entered_at: false,
        record_type: 'entry',
      }

    @entry = @new_entry()

    @toggle_tag = (tag) ->
      vm.entry.tags[tag.name] = !vm.entry.tags[tag.name]

    @update_burn_rate = ->
      sum = 0
      for entry in vm.entries
        sum = sum + entry.pennies
      vm.burn_rate = sum

    @add_entry = ->
      vm.entry.pennies = parseInt vm.new_entry_amount
      vm.entry.comment = vm.new_entry_comment
      vm.entry.entered_at = moment().format()
      AXEdb.post @entry
        .then ->
          vm.update()
      vm.entry = @new_entry()
      vm.new_entry_amount = undefined
      vm.new_entry_comment = ""

    @entry_tags = (entry) ->
      return _.filter @tags, (v,k,c) -> entry.tags[v.name]

    @update = ->
      AXEdb.recent_entries()
        .then (results) ->
          vm.entries = _.map results.rows, (v, i, r) -> v.doc
          vm.update_burn_rate()

    @update()

    @
}
