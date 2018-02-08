angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenRememory', {
  template: require('./screenRememory.html.hamlc'),
  controller: (pouchDB) ->
    vm = @

    @db = pouchDB "rememory"
    @new_memory = {name:"",value:""}
    @add_memory = =>
      @db.post @new_memory
      console.log @new_memory
    @load_memories = =>
      @memories = []
      @db.allDocs {include_docs:true}
        .then (response) =>
          console.log response.rows
          for memory in response.rows
            @memories.push memory.doc
          console.log @memories
    @load_memories()
    @

}
