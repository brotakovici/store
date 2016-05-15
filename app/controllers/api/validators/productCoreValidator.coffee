module.exports = (validator, errors) ->
  stringLengthOptions = {
    min: 5
    max: 80
  }

  validateProductAdd = (product, done) ->
    console.log product
    return done(null, product)
