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
  $stateProvider.state {name: 'layout', template: require('./layout.html.hamlc')}
  $stateProvider.state {name: 'gameWrapper', url: '/gameWrapper', parent: 'layout', component: 'gameWrapper'}
  $stateProvider.state {name: 'mono', url: '/mono', parent: 'gameWrapper', component: 'mono'}

  $urlRouterProvider.when '', '/gameWrapper/mono'
