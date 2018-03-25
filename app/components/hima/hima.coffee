angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'hima', {
  template: require('./hima.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state, himadb) ->
    vm = @
    @add_hima_name = ""
    @himatachi = []
    @load_himatachi = =>
      himadb.db.allDocs({include_docs: true})
        .then (r) =>
          console.log r
          @himatachi = _.map r.rows, (c) -> c.doc
    @load_himatachi()
    @add_hima = =>
      himadb.post {name: @new_hima_name}
      @new_hima_name = ""
      console.log "added_hima"

    @
}
