angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

#resources
# [{"name":"Catnip"},{"name":"Wood"}]
# buildings
# [{"name":"Farm","costs":[{"name":"Wood","amount":"5"}],"produces":[]}]
# game
# {"resources":{"Catnip":10,"Wood":5},"buildings":{"Farm":1}}

app.component 'frontPage', {
  template: require('./frontPage.html.hamlc'),
  controller: ($http, $interval, ggdb) ->
    vm = @

    @vbgs = []
    @load_vbgs = =>
      ggdb.vbgs().then (r) =>
        @vbgs = _.map r.rows, (row) -> row.doc
    @load_vbgs()
    @

}
