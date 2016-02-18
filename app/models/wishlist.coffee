mongoose = require('mongoose')
ObjectId = mongoose.Schema.ObjectId;

wishlistSchema = mongoose.Schema({
  products: [{
        productId: ObjectId
        quantity: Number
    }]
})

module.exports = mongoose.model('Wishlist', wishlistSchema, 'wishlist')
