module.exports = (dependencies) ->

  dependencies.database.connect('mongodb://localhost/store')

  userCoreValidator = dependencies.core_validators.userCoreValidator(dependencies.npm.validator, dependencies.misc.errors)
  productCoreValidator = dependencies.core_validators.productCoreValidator(dependencies.npm.validator, dependencies.misc.errors)

  productCore = dependencies.core_controllers.productCore(dependencies.models.productModel(dependencies.database), productCoreValidator)
  userCore = dependencies.core_controllers.userCore(dependencies.models.userModel(dependencies.database), dependencies.npm.async,dependencies.misc.errors, userCoreValidator)

  core_controllers = {
    userCore: userCore
  }

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
    core_controllers: core_controllers
    api_controllers: api_controllers
    view_controllers: view_controllers
  }