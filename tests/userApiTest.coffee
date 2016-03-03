expect = require('chai').expect
dependencies = require('../app/dependencies')
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

describe('User API Controller', () ->
  user = dependencies.api_controllers.user
  
  describe('self', () ->
  
  )
  
  describe('edit', () ->
  
  )
  
  describe('one', () ->
  
  )
)