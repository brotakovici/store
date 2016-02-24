mongoose = require('mongoose')
ObjectId = mongoose.Schema.ObjectId

cartSchema = mongoose.Schema({
  products: [{
        productId: ObjectId
        quantity: Number
    }]
})

module.exports = mongoose.model('Cart', cart, 'cart')
