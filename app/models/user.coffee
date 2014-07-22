mongoose = require('mongoose')
bcrypt = require('bcrypt-nodejs')

userSchema = mongoose.Schema({
  local: {
    email: String
    password: String
    isAdmin: {
      type: Boolean
      default: false
    }
    phoneNumber: String
    city: String
    county: String
    address: String
    postcode: String
  }
})

userSchema.methods.generateHash = (password) ->
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null)

userSchema.methods.isValidPassword = (password) ->
  return bcrypt.compareSync(password, this.local.password)

module.exports = mongoose.model('User', userSchema, 'user')