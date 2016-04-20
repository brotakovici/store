

module.exports = (validator, errors) ->

  validateSignUp = (values, done) ->
    if not validator.isEmail(email)
      return done([errors.invalid_email], null)
    
    return done(null, values)

  return {
    validateSignUp: validateSignUp
  }