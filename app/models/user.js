var mongoose = require('mongoose');
var bcrypt = require('bcrypt-nodejs');

var userSchema = mongoose.Schema({
  local : {
    email : String,
    password : String,
    isAdmin : {
                type : Boolean, 
                defaul: false
              }
    phoneNumber : String,
    city : String,
    county : String, 
    address : String,
    postcode : String
  },
});

userSchema.methods.generateHash = function (password) {
  return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

userSchema.methods.isValidPassword = function (password) {
  return bcrypt.compareSync(password, this.local.password);
};

module.exports = mongoose.model('User', userSchema, 'user');
