angular = require 'angular'
_ = require 'lodash'
uiRouter  = require '@uirouter/angularjs'
ngAnimate = require 'angular-animate'
require 'expose-loader?PouchDB!pouchdb'
pdb = require 'angular-pouchdb'
angularMaterialize = require 'angular-materialize'
require 'angular-moment'


require('materialize-css/bin/materialize.css')
require('materialize-css/bin/materialize.js')
#require "style-loader!css-loader!./mobile-angular-ui-base.css"

app = angular.module 'AXE', [
  'ui.router',
  'ngAnimate',
  'pouchdb',
  angularMaterialize,
  'angularMoment'
]

app.constant 'moment', require 'moment-timezone'

require './services/services.coffee'
require './components/components.coffee'

app.config ($stateProvider) ->
  main    = {name: 'main',    url: '/main',    template: require('./main.html.hamlc')}
  $stateProvider.state main
  $stateProvider.state {name: 'kiiro', url: '/kiiro', component: 'kiiro'}
  $stateProvider.state {name: 'daidaiiro', url: '/daidaiiro', component: 'daidaiiro'}
  $stateProvider.state {name: 'akai', url: '/akai', component: 'akai'}
  $stateProvider.state {name: 'murasaki', url: '/murasaki', component: 'murasaki'}
  $stateProvider.state {name: 'aoi', url: '/aoi', component: 'aoi'}
  $stateProvider.state {name: 'midori', url: '/midori', component: 'midori'}
  $stateProvider.state {name: 'tags', url: '/tags', component: 'tags'}
  $stateProvider.state {name: 'accounts', url: '/accounts', component: 'accounts'}
  $stateProvider.state {name: 'entry', url: '/entry', component: 'entry'}
  $stateProvider.state {name: 'admin', url: '/admin', component: 'admin'}
