module.exports = (validator, errors) ->

  # Check if its  string outright or object with email property
  validateEmail = (values, done) ->
    if not validator.isEmail(values.email)
      return done([errors.invalid_email], null)

    return done(null, values)

  validateEditValues = (values, done) ->
    done(null, values)

  return {
    validateEmail: validateEmail
  }