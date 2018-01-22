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
  #$stateProvider.state('screenAigg', {url: '/aigg', abstract: true, template: '<ui-view/>'} )
  #$stateProvider.state {name: 'screenAigg', url: '/aigg', component: 'screenAigg'}

  $stateProvider.state {name: 'screenAigg', url: '', component: 'screenAigg'}
  $stateProvider.state {name: 'screenAigg.tab', url: '/{tabId}', component: 'screenAigg'}
  $stateProvider.state {name: 'screenZootopiaGenkified', url: '/screenZootopiaGenkified', component: 'screenZootopiaGenkified'}
  $stateProvider.state {name: 'screenDaegorysWorld', url: '/screenDaegorysWorld', component: 'screenDaegorysWorld'}

  $urlRouterProvider.when('/', '/aigg');
