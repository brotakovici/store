module.exports = (dependencies) ->
  productCore = dependencies.core_controllers.productCore(dependencies.models.productModel, dependencies.npm.validator)
  userCore = dependencies.core_controllers.userCore(dependencies.models.userModel, dependencies.npm.async,dependencies.misc.errors, dependencies.npm.validator)

  #User = require('./models/user')
  #console.log User

  api_controllers = {
    user: dependencies.api_controllers.user(userCore)
    product: dependencies.api_controllers.product(productCore)
  }

  view_controllers = {
    product: dependencies.view_controllers.product(productCore)
    user: dependencies.view_controllers.user
    home: dependencies.view_controllers.home
  }

  return {
    api_controllers: api_controllers
    view_controllers: view_controllers
  }