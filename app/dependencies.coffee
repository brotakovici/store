#Dependencies go here   
module.exports = {
  # MODELS
  userModel: require('./models/user')
  productModel: require('./models/product')
  
  # CORE CONTROLLERS
  userCore: require('./controllers/api/user_core')
  productCore: require('./controllers/api/product_core')
  
  # API CONTROLLERS
  
  # VIEW CONTROLLERS
  
  # MISC
  errors: require('./lib/errors')
  
  # NPM MODULES
  validator: require('validator')
  async: require('async')
 
}