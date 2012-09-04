Spine = require('spine')

class Vehicle extends Spine.Model
  @configure 'Vehicle',
  'img', 
  'year', 
  'make', 
  'model', 
  'trim',
  'vin',
  'odometer',
  'color',
  'price',
  'date', 
  'dealershipName',
  'dealershipAddress',
  'dealershipCity',
  'dealershipState',
  'dealershipZip',
  'dealershipPhone',
  'dealershipDistance',
  'messageOneType',
  'messageOneDealership',
  'messageOneMessage',
  'messageOnePrice',
  'messageOneTime',
  'messages'





  @extend Spine.Model.Ajax
  
  load: ->
    super
    @date = new Date(@date)
  
  @dateSort: (a) ->
    console.log(a.date)
    if (a.date) > (a.date) then 1 else -1

  toJSON: =>
    atts = @.attributes;
    delete atts.id;
    return atts;
  
  # @extend @Local
  
  
module.exports = Vehicle