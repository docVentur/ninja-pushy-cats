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


app = angular.module 'GG', [
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
require './services/gg.css'

app.constant 'moment', require 'moment-timezone'

app.run ($rootScope) ->
  $rootScope.$on "$stateChangeError", console.log.bind console

app.config ($stateProvider, $urlRouterProvider) ->
#  $stateProvider.state {name: 'screenAigg.aiTabY', url: '/aiTabY', component: 'aiTabY'}
#  $stateProvider.state {name: 'screenAigg.aiTabO', url: '/aiTabO', component: 'aiTabO'}
#  $stateProvider.state {name: 'screenAigg.aiTabR', url: '/aiTabR', component: 'aiTabR'}
#  $stateProvider.state {name: 'screenAigg.aiTabP', url: '/aiTabP', component: 'aiTabP'}
#  $stateProvider.state {name: 'screenAigg.aiTabB', url: '/aiTabB', component: 'aiTabB'}
#  $stateProvider.state {name: 'screenAigg.aiTabG', url: '/aiTabG', component: 'aiTabG'}
#  $stateProvider.state {name: 'screenAigg.aiTabW', url: '/aiTabW', component: 'aiTabW'}
#  $stateProvider.state {name: 'screenAigg.aiTabL', url: '/aiTabL', component: 'aiTabL'}
#  $stateProvider.state {name: 'screenAigg.aiTabE', url: '/aiTabE', component: 'aiTabE'}
#  $stateProvider.state {name: 'screenAigg.aiTabI', url: '/aiTabI', component: 'aiTabI'}
#  $stateProvider.state {name: 'screenAigg.aiTabC', url: '/aiTabC', component: 'aiTabC'}
#  $stateProvider.state {name: 'screenAigg.aiTabN', url: '/aiTabN', component: 'aiTabN'}

#  $stateProvider.state {name: 'screenRememory', url: '/screenRememory', component: 'screenRememory'}
#  $stateProvider.state {name: 'frontPage', url: '/index', component: 'frontPage'}
#  $stateProvider.state {name: 'screenAigg', url: '/aigg', component: 'screenAigg'}
#  $stateProvider.state {name: 'screenTsugu', url: '/tsugu', component: 'screenTsugu'}
  $stateProvider.state {name: 'editorBuildings', url: '/editorBuildings', component: 'editorBuildings'}
  $stateProvider.state {name: 'editorggSudo', url: '/editorggSudo', component: 'editorggSudo'}

  $urlRouterProvider.when '', '/editorggSudo'
