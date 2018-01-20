angular = require 'angular'
_ = require 'lodash'
uiRouter  = require '@uirouter/angularjs'
ngAnimate = require 'angular-animate'
require 'expose-loader?PouchDB!pouchdb'
pdb = require 'angular-pouchdb'
angularMaterialize = require 'angular-materialize'
require 'angular-moment'

require "angular-resource"


require('materialize-css/bin/materialize.css')
require('materialize-css/bin/materialize.js')
#require "style-loader!css-loader!./mobile-angular-ui-base.css"
require('./DKD.css')

app = angular.module 'GG', [
  'ui.router',
  'ngResource',
  'ngAnimate',
  angularMaterialize,
  'angularMoment'
]

app.constant 'moment', require 'moment-timezone'

require './services/services.coffee'
require './components/components.coffee'

app.config ($stateProvider) ->
  $stateProvider.state {name: 'aiTabI', url: '/aiTabI', component: 'aiTabI'}
  $stateProvider.state {name: 'aiTabC', url: '/aiTabC', component: 'aiTabC'}
  $stateProvider.state {name: 'aiTabN', url: '/aiTabN', component: 'aiTabN'}
  $stateProvider.state {name: 'aiTabY', url: '/aiTabY', component: 'aiTabY'}
  $stateProvider.state {name: 'aiTabO', url: '/aiTabO', component: 'aiTabO'}
  $stateProvider.state {name: 'aiTabR', url: '/aiTabR', component: 'aiTabR'}
  $stateProvider.state {name: 'aiTabP', url: '/aiTabP', component: 'aiTabP'}
  $stateProvider.state {name: 'aiTabB', url: '/aiTabB', component: 'aiTabB'}
  $stateProvider.state {name: 'aiTabG', url: '/aiTabG', component: 'aiTabG'}
  $stateProvider.state {name: 'aiTabW', url: '/aiTabW', component: 'aiTabW'}
  $stateProvider.state {name: 'aiTabL', url: '/aiTabL', component: 'aiTabL'}
  $stateProvider.state {name: 'aiTabE', url: '/aiTabE', component: 'aiTabE'}
