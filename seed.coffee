mongoose = require('mongoose');
# schema = require('app/models/vehicle')
# db = mongoose.createConnection('localhost', 'vehicles');
db = mongoose.connect('mongodb://localhost/vehicles');
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
    'dealership': {},
    'messages': []
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
    dealership:
      name: 'Purple Dealer',
      address: '124 Fun Drive',
      city: 'Atlanta',
      state: 'GA',
      zip: '30042',
      phone: '555-555-5555',
      distance: '20',
    messages:[
       Message =
        type: 'question',
        dealership: 'Blue Dealer',
        message: 'A great new message',
        price: '10,000',
        time: Date.now()
      ]

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
    dealership:
      name: 'Blue Dealer',
      address: '6090 Smuggle Drive',
      city: 'Atlanta',
      state: 'Georgia',
      zip: '30042',
      phone: '555-555-5555',
    messages:[
      Message =
        type: 'message',
        dealership: 'Red Dealer',
        message: 'A smell that portends an aroma',
        price: '45,000',
        time: Date.now(),
      Message =
        type:'message',
        dealership: 'Green Dealer',
        message: 'A sight that portends a vision',
        price: '145,000',
        time: Date.now(),
      Message =
        type: 'offer',
        dealership: 'Yellow Dealer',
        message: 'A flavor that portends a taste',
        price: '12,000',
        time: Date.now()
    ]

  console.log 'sweet'  
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