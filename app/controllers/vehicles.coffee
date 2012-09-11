Spine = require('spine')
{Panel} = require('spine.mobile')
# List    = require('spine/lib/list')
$ = Spine.$
Vehicle = require('models/vehicle')


class VehicleMessages extends Panel
  title: 'Buying'
  
  className: 'vehicle messages'

  elements:
    '.vehicle.messages article .item': 'items'
  
  events:
    'tap .item': 'click'

  constructor: ->
    super

    # @addButton('Add', @add)
    Vehicle.bind('refresh change', @render)
    # @list = new List
    #   el: @items, 
    #   template: require('views/vehicles/item') 

  render: =>
    vehicles = Vehicle.all().sort(Vehicle.sortDate)
    @html require('views/vehicles/item')(vehicles)

  # add: ->
  #   console.log("sweetness")

  click: (e) ->
    console.log(e)
    item = $(e.currentTarget).item()
    @navigate('/vehicles', item.id, trans: 'right')

class VehicleMessageDetails extends Panel
  
  events:
    'tap .declineButton': 'declineButtonClick'
    'tap .messageButton': 'messageButtonClick'
    'tap .counterButton': 'counterButtonClick'
    'tap .acceptButton': 'acceptButtonClick'
    'tap .callButton': 'callButtonClick'

  constructor: ->
    super
    
    Vehicle.bind 'change', @render
    
    @active @change
    
    @addButton('Back', @back)

    # @addFooterButton('Message', @hello)
  
  render: =>
    return unless @vehicle
    @html require('views/vehicles/details')(@vehicle)
  
  change: (params) ->
    @vehicle = Vehicle.find(params.id)
    @render()
    
  back: ->
    @navigate('/vehicles', trans: 'left')

  declineButtonClick: ->
    console.log("touch/clicked the decline button")
    @navigate('/message', trans: 'right')

  messageButtonClick: ->
    console.log("touch/clicked the message button")
    item = {id: 123}
    # @navigate('/messages', item.id, trans: 'right')
    @navigate('/message', trans: 'right')

  counterButtonClick: ->
    console.log("touch/clicked the counter button")
    @navigate('/counter', trans: 'right')

  acceptButtonClick: ->
    console.log("touch/clicked the accept button")
    @navigate('/message', trans: 'right')

  callButtonClick: ->
    console.log("touch/clicked the call button")

  # addFooterButton: (text, callback) ->
  #   callback = @[callback] if typeof callback is 'string'
  #   button = $('<button />').text(text)
  #   button.tap(@proxy(callback))
  #   $('footer').append(button)
  #   button 

class NewVehicleMessage extends Panel

  constructor: ->
    super
    @render()
    @addButton('Back', @back)
  
  render: =>
    @html require('views/vehicles/message')

class CounterMessage extends Panel

  constructor: ->
    super
    @render()
  
  render: =>
    @html require('views/vehicles/counter')


class Vehicles extends Spine.Controller
  constructor: ->
    super

    @messages = new VehicleMessages
    @messageDetails = new VehicleMessageDetails
    @newVehicleMessage = new NewVehicleMessage
    @newCounterMessage = new CounterMessage

    @routes 
      '/vehicles': (params) -> @messages.active(params)
      '/vehicles/:id': (params) -> @messageDetails.active(params)
      '/message': -> @newVehicleMessage.active()
      '/counter': -> @newCounterMessage.active()

    Vehicle.fetch()
    
module.exports = Vehicles