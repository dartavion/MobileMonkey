mongoose = require("mongoose")

# hardcoded for now
# mongoose.createConnection('localhost', 'vehicles')
mongoose.connect('mongodb://localhost/vehicles');

express = require('express')
app = express.createServer()
app.use(express.bodyParser())
app.use(express.logger())

# setting up Hem manually rather than use the server option
# so we can add things to our express server
Hem = require("hem")
hem = new Hem()
app.get(hem.options.cssPath, hem.cssPackage().createServer())
app.get(hem.options.jsPath, hem.hemPackage().createServer())
app.use(express.static("./public"))

# mongoose-rest gives us restful route for our mongoose models
# mongooseRest = require("mongoose-rest")
# mongooseRest.use(app, mongoose)

require "spine/lib/ajax"
Vehicle = require("./app/models/vehicle")

SpineGoose = require("spinegoose")
spineGoose = new SpineGoose
  app: app
  mongoose: mongoose
  models: [Vehicle]

app.listen(3000)