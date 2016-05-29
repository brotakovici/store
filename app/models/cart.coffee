module.exports = (mongoose) ->
  ObjectId = mongoose.Schema.ObjectId

  cartSchema = mongoose.Schema({
    products: [{
          productId: ObjectId
          quantity: Number
      }]
  })

  return mongoose.model('Cart', cartSchema, 'cart')
