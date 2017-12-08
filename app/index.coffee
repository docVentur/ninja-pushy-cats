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
require('./DKD.css')

app = angular.module 'GG', [
  'ui.router',
  'ngAnimate',
  angularMaterialize,
  'angularMoment'
]

app.constant 'moment', require 'moment-timezone'

require './services/services.coffee'
require './components/components.coffee'

app.config ($stateProvider) ->
  $stateProvider.state = {name: 'main', url: '/main', template: require('./main.html.hamlc')}
