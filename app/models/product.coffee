mongoose = require('mongoose')

productSchema = mongoose.Schema({
  product: {
    name: String
    quantity: Number
    price: Number
  }
})

module.exprorts = mongoose.model('Product', productSchema, 'product')
