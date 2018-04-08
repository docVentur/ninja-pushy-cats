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

require './components/components.coffee'
require './services/npc.css'

require './directives/directives.coffee'
require './services/services.coffee'
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
  $stateProvider.state {name: 'growingGenkiness', url: '/growingGenkiness', parent: 'kitemiteWrapper', component: 'growingGenkiness'}
  $stateProvider.state {name: 'npcWrapper', url: '/npcWrapper', parent: 'growingGenkiness', component: 'npcWrapper'}

  $urlRouterProvider.when '', '/kitemiteWrapper/growingGenkiness/npcWrapper'
