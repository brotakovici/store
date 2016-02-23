#Dependencies go here   
module.exports = {
  # MODELS
  models: {
    userModel: require('./models/user')
    productModel: require('./models/product')
  }
  # CORE CONTROLLERS
  core_controllers: {
    userCore: require('./controllers/api/user_core')
    productCore: require('./controllers/api/product_core')
  }
  # API CONTROLLERS
  api_controllers:{
    product: require('./controllers/api/product')
    user: require('./controllers/api/user')
  }
  
  # VIEW CONTROLLERS
  view_controllers: {
    product: require('./controllers/product')
    #user: require('./controllers/user')
  }
  
  # MISC
  misc: {
    errors: require('./lib/errors')
  }
  # NPM MODULES
  npm: {
    validator: require('validator')
    async: require('async')
  }
}