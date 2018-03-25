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

require './services/services.coffee'
require './components/components.coffee'
require './services/npc.css'
require './components/gameWrapper/gameWrapper.coffee'

app.constant 'moment', require 'moment-timezone'

app.run ($rootScope) ->
  $rootScope.$on "$stateChangeError", console.log.bind console

app.config ($stateProvider, $urlRouterProvider) ->
  npc_resolver = =>
    return {
      resources: {
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
  $stateProvider.state {name: 'gameWrapper', url: '/gameWrapper', parent: 'layout', component: 'gameWrapper', resolve: {npc: npc_resolver}}
  $stateProvider.state {name: 'carot', url: '/screen/carot', parent: 'gameWrapper', component: 'carot'}
  $stateProvider.state {name: 'pipe', url: '/screen/pipe', parent: 'gameWrapper', component: 'pipe'}
  $stateProvider.state {name: 'dot', url: '/screen/dot', parent: 'gameWrapper', component: 'dot'}
  $stateProvider.state {name: 'gdkp', url: '/screen/gdkp', parent: 'gameWrapper', component: 'gdkp'}

  $stateProvider.state {name: 'hima', url: '/hima', parent: 'gameWrapper', component: 'hima'}


  $stateProvider.state {name: 'mono', url: '/mono', parent: 'gameWrapper', component: 'mono'}
  $stateProvider.state {name: 'sudo', url: '/sudo', parent: 'gameWrapper', component: 'sudo'}
  $stateProvider.state {name: 'dotowo', url: '/dotowo', parent: 'gameWrapper', component: 'dotowo'}
  $stateProvider.state {name: 'tsugu', url: '/tsugu', parent: 'gameWrapper', component: 'tsugu'}

  $urlRouterProvider.when '', 'gameWrapper'

# #::AGD The code for this project is guided by The Art of Game Design: A Book of Lenses by Jesse Schell published by CRC Press 2015
