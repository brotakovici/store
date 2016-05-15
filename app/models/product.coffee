mongoose = require('mongoose')

productSchema = mongoose.Schema({
  name: String
  quantity: Number
  price: Number
  description: String
  options: [String]
  photoPath: String
})

module.exports = mongoose.model('Product', productSchema, 'product')
