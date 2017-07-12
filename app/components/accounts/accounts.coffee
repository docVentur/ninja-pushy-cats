angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'accounts', {
  template: require('./accounts.html.hamlc'),
  controller: (AXEdb, moment) ->
    vm = @

    @accounts = []
    @edit_account = []
    @entry_amount = undefined

    @update = ->
      AXEdb.accounts().then (results) ->
        vm.accounts = _.map results.rows, (v, i, r) -> v.doc
        vm.total = 0
        vm.high_water_total = 0
        _.map vm.accounts, (account) ->
          vm.total = vm.total + account.pennies
          vm.high_water_total = vm.high_water_total + account.high_water_pennies


    @enter_new_balance = (index) ->
      account = @accounts[index]
      @entry_amount = parseInt @entry_amount
      now = moment().format()
      AXEdb.post {account_name: account.name, pennies: vm.entry_amount, entered_at: now, record_type: 'account_entry'}
      if account.high_water_pennies < @entry_amount
        account.high_water_pennies = @entry_amount
        account.high_water_entered_at = now
      account.pennies = @entry_amount
      account.entered_at = now
      AXEdb.put account
      @edit_account = []
      @entry_amount = undefined
      @update()

    @edit_account_index = (index) ->
      @edit_account = []
      @edit_account[index] = true

    @update()

    @
}
