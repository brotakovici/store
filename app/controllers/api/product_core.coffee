# This file here will handle all product related db operations and shit
Product = require('../../models/product')

getAll = (done) ->
  Product.find({}, (err, doc) ->
    if err?
      return done(err, null)
    else
      return done(null, doc)
  )

getProduct = (id, done) ->
  Product.findOne({'_id': id}, (err, doc) ->
      if err?
          console.log err
          return done(err, null)
      
      return done(null, doc)
  )

module.exports = {
  getAll: getAll
  getProduct: getProduct
}
