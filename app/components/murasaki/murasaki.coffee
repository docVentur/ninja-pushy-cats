angular = require 'angular'
_ = require 'lodash'

app = angular.module 'AXE'

app.component 'murasaki', {
  template: require('./murasaki.html.hamlc'),
  controller: (DaegoryFSM, $stateParams, moment) ->
    vm = @
    
    @daegory = DaegoryFSM.init_daegory()

    DaegoryFSM.tick(@daegory)

    @
}
