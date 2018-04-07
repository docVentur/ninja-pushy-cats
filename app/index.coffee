angular = require 'angular'
_ = require 'lodash'
uiRouter  = require '@uirouter/angularjs'
ngAnimate = require 'angular-animate'
db = require 'angular-pouchdb'
angularMaterialize = require 'angular-materialize'

require 'angular-moment'
require 'angular-resource'
require 'angular-css'
require 'expose-loader?PouchDB!pouchdb'
require('materialize-css/bin/materialize.css')
require('materialize-css/bin/materialize.js')

app = angular.module 'npc', [
  'ui.router',
  'ngResource',
  'pouchdb',
  'ngAnimate',
  'angularCSS',
  angularMaterialize,
  'angularMoment'
  ]

#require './components/components.coffee'
require './services/npc.css'

#require './directives/directives.coffee'
#require './services/services.coffee'
#require './components/gameWrapper/gameWrapper.coffee'
#require './components/ggWrapper/ggWrapper.coffee'
require './components/kitemiteWrapper/kitemiteWrapper.coffee'
require './components/npcWrapper/npcWrapper.coffee'
require './components/growing_genkiness/growing_genkiness.coffee'

app.constant 'moment', require 'moment-timezone'

app.run ($rootScope) ->
  $rootScope.$on "$stateChangeError", console.log.bind console

app.config ($stateProvider, $urlRouterProvider) ->
  npc_resolver = =>
    return {
      resources: {
        ai: 0
        yellow: 0
        orange: 0
        red: 0
        purple: 0
        blue: 0
        green: 0
        white: 0
        black: 0
        grey: 0
        pink: 0
        cyan: 0
        brown: 0
      }
      iteration: 0

  }

  $stateProvider.state {name: 'layout', template: require('./layout.html.hamlc')}
  $stateProvider.state {name: 'kitemiteWrapper', url: '/kitemiteWrapper', parent: 'layout', component: 'kitemiteWrapper'}
  $stateProvider.state {name: 'npcWrapper', url: '/npcWrapper', parent: 'kitemiteWrapper', component: 'npcWrapper'}

  $stateProvider.state {name: 'growingGenkiness', url: '/growingGenkiness', parent: 'npcWrapper', component: 'growingGenkiness'}

  $urlRouterProvider.when '', '/kitemiteWrapper/npcWrapper/growingGenkiness'


#  $stateProvider.state {name: 'aigg', url: '/aigg', parent: 'growingGenkiness', component: 'aigg'}

  #$stateProvider.state {name: 'gg', url: 'gg', parent: 'kitemite', component: 'ggWrapper'
  #$stateProvider.state {name: 'growing_genkiness', url: 'growing_genkiness', parent: 'gg', component: 'growing_genkinessWrapper', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'aiyellow', url: 'aiyellow', parent: 'growing_genkiness', component: 'aiyellowb00k', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'cards', url: 'aiyellow', parent: 'growing_genkiness', component: 'playingcards', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'catastrophy', url: 'aiyellow', parent: 'growing_genkiness', component: 'catastrophycircuitfires', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'pokerface', url: 'aiyellow', parent: 'growing_genkiness', component: 'pokerface', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'web.f00t.map', url: 'aiyellow', parent: 'growing_genkiness', component: 'web.f00t.map', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'sudoku', url: 'aiyellow', parent: 'growing_genkiness', component: 'aiyellowb00k', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'greatgrand', url: 'GREAT&GRAND', parent: 'gg', component: 'greatgrandWrapper', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'guchigenkigame', url: 'guchigenkigame', parent: 'gg', component: 'guchigenkigameWrapper', resolve: {npc: npc_resolver}}
  #$stateProvider.state {name: 'gdkp', url: 'gdkp', parent: 'kitemite', component: 'gdkpWrapper', resolve: {npc: npc_resolver}}

#  $stateProvider.state {name: 'ggWrapper', url: '', parent: 'layout', component: 'ggWrapper', resolve: {npc: npc_resolver}}
#  $stateProvider.state {name: 'gameWrapper', url: '', parent: 'ggWrapper', component: 'gameWrapper', resolve: {npc: npc_resolver}}
#  $stateProvider.state {name: 'carot', url: '/screen/carot', parent: 'gameWrapper', component: 'carot'}
#  $stateProvider.state {name: 'pipe', url: '/screen/pipe', parent: 'gameWrapper', component: 'pipe'}
#  $stateProvider.state {name: 'dot', url: '/screen/dot', parent: 'gameWrapper', component: 'dot'}
#  $stateProvider.state {name: 'dotmaiowo', url: '/screen/dotmaiowo', parent: 'gameWrapper', component: 'dotmaiowo'}
#  $stateProvider.state {name: 'gdkp', url: '/screen/gdkp', parent: 'gameWrapper', component: 'gdkp'}
#  $stateProvider.state {name: 'hima', url: '/hima', parent: 'gameWrapper', component: 'hima'}
#  $stateProvider.state {name: 'himaDetail', url: '/hima/:parent', parent: 'gameWrapper', component: 'hima'}
#  $stateProvider.state {name: 'mono', url: '/mono', parent: 'gameWrapper', component: 'mono'}
#  $stateProvider.state {name: 'sudo', url: '/sudo', parent: 'gameWrapper', component: 'sudo'}
#  $stateProvider.state {name: 'dotowo', url: '/dotowo', parent: 'gameWrapper', component: 'dotowo'}
#  $stateProvider.state {name: 'tsugu', url: '/tsugu', parent: 'gameWrapper', component: 'tsugu'}
