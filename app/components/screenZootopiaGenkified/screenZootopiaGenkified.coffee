angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'screenZootopiaGenkified', {
  template: require('./screenZootopiaGenkified.html.hamlc'),
  controller: (DaegoryFSM, MassFSM, FeelingsFSM, $stateParams, moment, $interval) ->
    vm = @
    @daegory = DaegoryFSM.init_daegory()
    @minion = 1
    MassFSM.init_Mass @daegory, 23
    FeelingsFSM.init_Feelings @daegory, 9
    console.log @daegory
}
