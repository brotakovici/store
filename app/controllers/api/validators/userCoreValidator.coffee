

module.exports = (validator, errors) ->

  # Check if its  string outright or object with email property
  validateEmail = (email, done) ->
    if not validator.isEmail(email)
      return done([errors.invalid_email], null)
    
    return done(null, email)
    
  validateEditValues = (values, done) ->
    done(null, values)

  return {
    validateEmail: validateEmail
  }