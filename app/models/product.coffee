module.exports = (mongoose) ->
#mongoose = require('mongoose')
  productSchema = mongoose.Schema({
    name: String
    quantity: Number
    price: Number
    description: String
    options: [String]
    photoPath: String
  })

  return mongoose.model('Product', productSchema, 'product')
