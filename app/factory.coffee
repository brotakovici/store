module.exports = (dependencies) ->
    
    productCore = dependencies.productCore(dependencies.productModel, dependencies.validator)
    userCore = dependencies.userCore(dependencies.userModel, dependencies.async, dependencies.errors, dependencies.validator)
  
    return {
      productCore: productCore
      userCore: userCore
    }