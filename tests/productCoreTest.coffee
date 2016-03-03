Mongoose = require('mongoose').Mongoose
mongoose = new Mongoose()

mockgoose = require('mockgoose')
mockgoose(mongoose)

before(() ->
  mongoose.connect('mongodb://localhost/storeTest', (err) ->
        console.log err
  )
)

beforeEach(() ->
  
)