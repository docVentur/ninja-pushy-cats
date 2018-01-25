angular = require 'angular'
_ = require 'lodash'
uiRouter  = require '@uirouter/angularjs'
ngAnimate = require 'angular-animate'
db = require 'angular-pouchdb'
angularMaterialize = require 'angular-materialize'


require 'angular-moment'
require "angular-resource"



require './DKD.css'



require 'expose-loader?PouchDB!pouchdb'

require('materialize-css/bin/materialize.css')
require('materialize-css/bin/materialize.js')

app = angular.module 'GG', [
  'ui.router',
  'ngResource',
  'ngAnimate',
  angularMaterialize,
  'angularMoment'
]
require './services/services.coffee'
require './components/components.coffee'

app.constant 'moment', require 'moment-timezone'

app.run ($rootScope) ->
  $rootScope.$on("$stateChangeError", console.log.bind(console))

app.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider.state {name: 'aiTabY', url: '/aiTabY', component: 'aiTabY'}
  $stateProvider.state {name: 'aiTabO', url: '/aiTabO', component: 'aiTabO'}
  $stateProvider.state {name: 'aiTabR', url: '/aiTabR', component: 'aiTabR'}
  $stateProvider.state {name: 'aiTabP', url: '/aiTabP', component: 'aiTabP'}
  $stateProvider.state {name: 'aiTabB', url: '/aiTabB', component: 'aiTabB'}
  $stateProvider.state {name: 'aiTabG', url: '/aiTabG', component: 'aiTabG'}
  $stateProvider.state {name: 'aiTabW', url: '/aiTabW', component: 'aiTabW'}
  $stateProvider.state {name: 'aiTabL', url: '/aiTabL', component: 'aiTabL'}
  $stateProvider.state {name: 'aiTabE', url: '/aiTabE', component: 'aiTabE'}
  $stateProvider.state {name: 'aiTabI', url: '/aiTabI', component: 'aiTabI'}
  $stateProvider.state {name: 'aiTabC', url: '/aiTabC', component: 'aiTabC'}
  $stateProvider.state {name: 'aiTabN', url: '/aiTabN', component: 'aiTabN'}

#  $urlRouterProvider.when('', '/aiTabY');
