Mongoose = require('mongoose').Mongoose
mongoose = new Mongoose()

mockgoose = require('mockgoose')
mockgoose(mongoose)

dependencies = require('app/dependencies')

# Damn using mockgoose is hard

before(() ->
  mongoose.connect('mongodb://localhost/storeTest', (err) ->
    Product = dependencies.productModel(mongoose)
  )

)

beforeEach(() ->

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