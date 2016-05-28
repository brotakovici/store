module.exports = (mongoose) ->
  ObjectId = mongoose.Schema.ObjectId

  wishlistSchema = mongoose.Schema({
    products: [{
          productId: ObjectId
          quantity: Number
      }]
  })

  return mongoose.model('Wishlist', wishlistSchema, 'wishlist')