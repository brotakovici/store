#Dependencies go here   
module.exports = { 
  userModel: require('./models/user')
  productModel: require('./models/product')
  userCore: require('./controllers/api/user_core')
  productCore: require('./controllers/api/product_core')
  validator: require('validator')
  async: require('async')
  errors: require('/lib/errors')
}