bcrypt = require('bcrypt-nodejs')

module.exports = (mongoose) ->
  ObjectId = mongoose.Schema.ObjectId

  userSchema = mongoose.Schema({

    email: String
    password: String
    firstName: String
    middleName: String
    lastName: String
    role: String
    phone: String
    city: String
    county: String
    country: String
    address: String
    postcode: String

    cart: {type: ObjectId, ref: 'Cart'}

    wishlist: [{type: ObjectId, ref: 'Product'}]
  })

  userSchema.methods.generateHash = (password) ->
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null)

  userSchema.methods.isValidPassword = (password) ->
    return bcrypt.compareSync(password, this.password)

  return mongoose.model('User', userSchema, 'user')