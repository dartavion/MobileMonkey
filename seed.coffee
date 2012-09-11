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

  acceptedOffer = new Vehicle
    img: '/assets/place-holder.gif',
    year: '2010',
    make: 'BMW',
    model: 'X6',
    vin: '1VBP8CYKJ4321111',
    color: 'blue',
    odometer: '21,202',
    price: '67,000',
    dealershipName: 'Munge',
    dealershipAddress: 'Wiley Coyote (super genius)',
    dealershipCity: 'Atlanta',
    dealershipState: 'GA',
    dealershipZip: '30042',
    dealershipPhone: '555-555-5555',
    dealershipDistance: '20',
    messageOneType: 'accepted',
    messageOneDealership: 'n Dealer',
    messageOneMessage: 'A great new message',
    messageOnePrice: '10,000',
    messageOneTime: new Date()

  multipleMessages = new Vehicle
    img: '/assets/place-holder.gif',
    year: '2010',
    make: 'Chevy',
    model: 'Truck',
    vin: '4VBP8CYKJ4322222',
    color: 'blue',
    odometer: '222,922',
    price: '17,000',
    distance: '30',
    dealershipName: 'R3e Dealer',
    dealershipAddress: '6090 Smuggle Drive',
    dealershipCity: 'Atlanta',
    dealershipState: 'Georgia',
    dealershipZip: '30042',
    dealershipPhone: '555-555-5555',
    messageOneType: 'offer',
    messageOneDealership: 'Red Dealer',
    messageOneMessage: 'A smell that portends an aroma',
    messageOnePrice: '45,000',
    messageOneTime: new Date(),
    messageTwoType:'message',
    messageTwoDealership: 'Green Dealer',
    messageTwoMessage: 'A sight that portends a vision',
    messageTwoPrice: '145,000',
    messageTwotime: new Date(),
    messageThreetype: 'accepted',
    messageThreeDealership: 'Yellow Dealer',
    messageThreeMessage: 'A flavor that portends a taste',
    messageThreePrice: '12,000',
    messageThreeTime: new Date()

  counter = new Vehicle
    img: '/assets/place-holder.gif',
    year: '2010',
    make: 'Willy Wonka',
    model: 'Bubble Maker',
    vin: '1VBP8CYKJ4323112',
    color: 'blue',
    odometer: '65,444',
    price: '60,000',
    dealershipName: 'Red Dealer',
    dealershipAddress: 'E Drive',
    dealershipCity: 'Atlanta',
    dealershipState: 'GA',
    dealershipZip: '30042',
    dealershipPhone: '555-555-5555',
    dealershipDistance: '20',
    messageOneType: 'counter',
    messageOneDealership: 'F Dealer',
    messageOneMessage: 'A great new message',
    messageOnePrice: '9,000',
    messageOneTime: new Date()

  declined = new Vehicle
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
    messageOneType: 'declined',
    messageOneDealership: 'Blue Dealer',
    messageOneMessage: 'A great new message',
    messageOnePrice: '10,000',
    messageOneTime: new Date()

  message = new Vehicle
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
    messageOneType: 'message',
    messageOneDealership: 'Blue Dealer',
    messageOneMessage: 'A great new message',
    messageOnePrice: '10,000',
    messageOneTime: new Date()


  
  acceptedOffer.save (err) ->
  multipleMessages.save (err) ->  
  counter.save (err) ->
  declined.save (err) ->
  message.save (err) ->

  #   if (err) 
  #   res.end('not saved')

# vehicleOne.save, (err) -> 
#   if (err)
  # res.end('not saved')


# vehicleTwo.save(err) ->
#   if (err) 
#   res.end('not saved')