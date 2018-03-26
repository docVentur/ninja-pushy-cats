angular = require 'angular'
_ = require 'lodash'

app = angular.module 'npc'

app.component 'hima', {
  template: require('./hima.html.hamlc'),
  bindings: {
    npc: "<"
  }

  controller: ($http, $interval, npc_fsm, $state, himadb, $stateParams) ->
    vm = @
    @new_hima_name = ""
    @himatachi = []
    @parent = $stateParams.parent
    @load_himatachi = =>
      himadb.db.allDocs({include_docs: true})
        .then (r) =>
          console.log r
          @himatachi = _.map r.rows, (c) -> c.doc
          @data = []
          for hima in @himatachi
            name = hima.name
            name = "#{hima.parent}.#{hima.name}" if hima.parent
            @data.push {name: name}
          console.log @data
    @load_himatachi()
    @add_hima = =>
      new_doc = {name: @new_hima_name}
      new_doc.parent = @parent if @parent
      himadb.post new_doc
      @new_hima_name = ""
      console.log "added_hima"
      @load_himatachi()

    @destroy_db = =>
      himadb.db.destroy()
        .then =>
          @load_himatachi()
    @
}
