before((done) ->
  console.log '???'

  Mongoose = require('mongoose').Mongoose
  mongoose = new Mongoose()
  mockgoose = require('mockgoose')

  dependencies = require('../app/dependencies')
  Product = {}
  mockgoose(mongoose).then(() ->
    mongoose.connect('mongodb://localhost/storeTest', (err) ->
      if err?
        console.log err
      else
        Product = dependencies.productModel(mongoose)

      return done()
    )
  )
)

beforeEach(() ->
  console.log 'this one den?'
  testProduct = new Product({

  })

  testProduct.save((err, doc) ->
    if err?
      console.log err
  )
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