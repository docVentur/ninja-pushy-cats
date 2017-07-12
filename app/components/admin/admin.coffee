angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'admin', {
  template: require('./admin.html.hamlc'),
  controller: (AXEdb, moment) ->
    vm = @
    db = AXEdb.db

    @add_account = ->
      account = @new_account()
      account.name = @new_account_name
      db.post account
        .then ->
          vm.new_account_name = ""
          vm.update()

    @new_account = ->
      return {
        pennies: 0,
        entered_at: moment().format(),
        high_water_pennies: 0,
        high_water_entered_at: moment().format(),
        record_type: 'account',
      }

    @update = ->
      AXEdb.accounts()
        .then (results) ->
          vm.accounts = _.map results.rows, (v, i, r) -> v.doc

    @nuke_all_accounts = ->
      AXEdb.accounts()
        .then (accounts) ->
          _.map accounts.rows, (v, i, r) -> db.remove v.doc

    @nuke_all_account_entries = ->
      AXEdb.account_entries()
        .then (account_entries) ->
          _.map account_entries.rows, (v, i, r) -> db.remove v.doc

    @nuke_all_tags = ->
      AXEdb.tags()
        .then (tags) ->
          _.map tags.rows, (v, i, r) -> db.remove v.doc

    @nuke_all_entries = ->
      AXEdb.entries()
        .then (entries) ->
          _.map entries.rows, (v, i, r) -> db.remove v.doc

    @update()

    @
}
