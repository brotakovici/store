module.exports = (validator, errors) ->

  nameLengthOptions = {
    min: 5
    max: 80
  }

  descriptionLengthOptions = {
    min: 5
    max: 250
  }

  addProduct = (product, done) ->
    if not validator.isLength(product.name, nameLengthOptions)
      return done(errors.name_length_error, null)

    if not validator.isLength(product.description, descriptionLengthOptions)
      return done(errors.description_length_error, null)

    if not validator.isInt(product.quantity)
      return done(errors.quantity_type_error, null)

    if not validator.isFloat(product.price)
      return done(errors.price_type_error, null)

    return done(null, product)

  return {
    addProduct: addProduct
  }