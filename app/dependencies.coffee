#Dependencies go here
module.exports = {
  # DATABASE

  database: require('mongoose')

  # MODELS
  models: {
    userModel: require('./models/user')
    productModel: require('./models/product')
    cartModel: require('./models/cart')
  }
  # CORE CONTROLLERS
  core_controllers: {
    userCore: require('./controllers/api/user_core')
    productCore: require('./controllers/api/product_core')
  }

  # CORE VALIDATORS
  core_validators: {
    userCoreValidator: require('./controllers/api/validators/userCoreValidator')
    productCoreValidator: require('./controllers/api/validators/productCoreValidator')
  }

  # API CONTROLLERS
  api_controllers:{
    product: require('./controllers/api/product')
    user: require('./controllers/api/user')
  }

  # VIEW CONTROLLERS
  view_controllers: {
    product: require('./controllers/product')
    user: require('./controllers/user')
    home: require('./controllers/home')
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