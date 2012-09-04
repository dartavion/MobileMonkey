mongoose = require('mongoose');
# schema = require('app/models/vehicle')
db = mongoose.createConnection('localhost', 'vehicles');
# db = mongoose.connect('mongodb://localhost/vehicles');
# model = require('./app/models/vehicle')


db.on 'error', -> console.error.bind console, 'connection error:'
db.once 'open', -> 
  schema = mongoose.Schema({
    'img':'string', 
    'year': 'string', 
    'make': 'string', 
    'model': 'string', 
    'trim': 'string',
    'vin': 'string',
    'odometer': 'string',
    'color': 'string',
    'price': 'string',
    'date': 'string',
    'dealershipName': 'string',
    'dealershipAddress': 'string',
    'dealershipCity': 'string',
    'dealershipState': 'string',
    'dealershipZip': 'string',
    'dealershipPhone': 'string',
    'dealershipDistance': 'string',
    'messageOneType': 'string',
    'messageOneDealership': 'string',
    'messageOneMessage': 'string',
    'messageOnePrice': 'string',
    'messageOneTime': 'string' 
  })

  Vehicle = db.model('Vehicle', schema)
    

  Message = {}

  vehicleOne = new Vehicle
    img: '/assets/place-holder.gif',
    year: '2010',
    make: 'BMW',
    model: 'X6',
    vin: '1VBP8CYKJ4324983',
    color: 'blue',
    odometer: '21,202',
    price: '67,000',
    dealershipName: 'Purple Dealer',
    dealershipAddress: '124 Fun Drive',
    dealershipCity: 'Atlanta',
    dealershipState: 'GA',
    dealershipZip: '30042',
    dealershipPhone: '555-555-5555',
    dealershipDistance: '20',
    messageOneType: 'question',
    messageOneDealership: 'Blue Dealer',
    messageOneMessage: 'A great new message',
    messageOnePrice: '10,000',
    messageOneTime: Date.now()

  vehicleTwo = new Vehicle
    img: '/assets/place-holder.gif',
    year: '2010',
    make: 'BMW',
    model: '238',
    vin: '4VBP8CYKJ4324983',
    color: 'blue',
    odometer: '10,902',
    price: '27,000',
    distance: '30',
    dealershipName: 'Blue Dealer',
    dealershipAddress: '6090 Smuggle Drive',
    dealershipCity: 'Atlanta',
    dealershipState: 'Georgia',
    dealershipZip: '30042',
    dealershipPhone: '555-555-5555',
    messageOneType: 'message',
    messageOneDealership: 'Red Dealer',
    messageOneMessage: 'A smell that portends an aroma',
    messageOnePrice: '45,000',
    messageOneTime: Date.now(),
    messageTwoType:'message',
    messageTwoDealership: 'Green Dealer',
    messageTwoMessage: 'A sight that portends a vision',
    messageTwoPrice: '145,000',
    messageTwotime: Date.now(),
    messageThreetype: 'offer',
    messageThreeDealership: 'Yellow Dealer',
    messageThreeMessage: 'A flavor that portends a taste',
    messageThreePrice: '12,000',
    messageThreeTime: Date.now()


  
  vehicleOne.save (err) ->
  vehicleTwo.save (err) ->  
  #   if (err) 
  #   res.end('not saved')

# vehicleOne.save, (err) -> 
#   if (err)
  # res.end('not saved')


# vehicleTwo.save(err) ->
#   if (err) 
#   res.end('not saved')