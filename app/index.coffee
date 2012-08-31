require('lib/setup')

# mon = require('mongoose')

Spine   = require('spine')
{Stage} = require('spine.mobile')
Vehicles = require('controllers/vehicles')

class App extends Stage.Global
  constructor: ->
    super
    
    new Vehicles
    Spine.Route.setup(shim: true)
    @navigate '/vehicles'
    
module.exports = App