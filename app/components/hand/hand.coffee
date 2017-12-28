angular = require 'angular'
_ = require 'lodash'

app = angular.module 'GG'

app.component 'vHand', {
  template: require('./hand.html.hamlc'),
  controller: ->
    @cards = []

    @cards.push Math.floor(Math.random() * 52)
    @cards.push Math.floor(Math.random() * 52)
    @cards.push Math.floor(Math.random() * 52)
    @cards.push Math.floor(Math.random() * 52)
    @cards.push Math.floor(Math.random() * 52)
    
    @
}
