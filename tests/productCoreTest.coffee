require('coffee-script').register()

Mongoose = require('mongoose').Mongoose
mongoose = new Mongoose()

mockgoose = require('mockgoose')
#mockgoose(mongoose)

chai = require('chai')

dependencies = require('app/dependencies')
Product = {}
# Damn using mockgoose is hard

before((done) ->
  mockgoose(mongoose).then(() ->
    mongoose.connect('mongodb://localhost/storeTest', (err) ->
      if err?
        console.log err
      else
        console.log "HURR DURR CONECTION WORKS"
        Product = dependencies.productModel(mongoose)

      done()
    )
  )
)

beforeEach(() ->
  ###
  Add test data
  ###
)

describe('Product API Core', () ->
  describe('getProduct()', ()->
    it('should return product', () ->

    )

    it('should throw error when no product', () ->

    )
  )

  describe('add()', ()->
    it('should add product', () ->

    )

    it('should throw error on name too short', () ->

    )

    it('should throw error on description too short', () ->

    )

    it('should throw error on description too short', () ->

    )

    it('should throw error on invalid quantity', () ->

    )

    it('should throw error on invalid price', () ->

    )
  )

  describe('edit()', ()->
    it('should edit product', () ->

    )

    it('should throw error on name too short', () ->

    )

    it('should throw error on description too short', () ->

    )

    it('should throw error on description too short', () ->

    )

    it('should throw error on invalid quantity', () ->

    )

    it('should throw error on invalid price', () ->

    )
  )

)