module.exports = (dependencies) ->
    
    productCore = dependencies.core_controllers.productCore(dependencies.models.productModel, dependencies.npm.validator)
    userCore = dependencies.core_controllers.userCore(dependencies.userModel, dependencies.npm.async, dependencies.misc.errors, dependencies.npm.validator)
  
    api_controllers = {
      user: dependencies.api_controllers.user(userCore)
      product: dependencies.api_controllers.product(productCore)
    }
  
    view_controllers = {
      product: dependencies.view_controllers.product(productCore)
    }
    
    return {
      api_controllers: api_controllers
      view_controllers: view_controllers
    }