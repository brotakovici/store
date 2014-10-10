User = require('../../models/user')
async = require('async')
errors  = require('../../lib/errors')

validateUserValuePresence = (values, done) ->
  areAllFieldsCompleted = values.local? && values.local.email? &&
    values.local.password? && values.firstName? &&
    values.lastName? && values.phone?

  if !areAllFieldsCompleted
    err = errors.user_invalid_arguments
    return done(err)

  return done(null)

validateUserValues = (values, done) ->
  phoneValidationRegex = new RegExp('^[0-9() \.\+]{3,}$')
  if values.length < 1
    err = errors.user_invalid_arguments
    return done(err)

  if values.firstName? && (values.firstName.length < 1 || values.firstName.length > 30)
    err = errors.user_invalid_arguments
    return done(err)

  if values.lastName? && (values.lastName.length < 1 || values.lastName.length > 30)
    err = errors.user_invalid_arguments
    return done(err)
  
  if values.phone? && !phoneValidationRegex.test(values.phone)
    err = errors.user_invalid_arguments
    return done(err)

  allowedRoles = ['patient']
  if values.role? && !(value.role in allowedRoles)
    err = errors.user_invalid_arguments
    return done(err)

checkIfUserEmailTaken = (values, done) ->
  User.find({'local.email': values.local.email}, (err, docs) =>
    if docs.length == 0
      return done(null)
    else
      err = errors.user_invalid_arguments
      return done(err)
  )

add = (values, done) ->
  err =  null

  addUser = (values, done) ->
    newUser = new User({
      local: {
        email: values.local.email
      }
      firstName: values.firstName
      lastName: values.lastName
      phone: values.phone
      city: values.city
      county: values.county
      address: values.address
      postcode: values.postcode
    })
    newUser.local.password = newUser.generateHash(values.local.password)
    newUser.save((err, doc) =>
      if err
        console.log err
        err = errors.registration_error
      return done(err, doc)
    )

  async.waterfall([
    (done) =>
      validateUserValuePresence(values, done)
    (done) =>
      validateUserValues(values, done)
    (done) =>
      checkIfUserEmailTaken(values, done)
    (done) =>
      addUser(values, done)
  ], ((err, doc) =>
    return done(err, doc)
  ))

one = (id, done) ->
  User.findOne({'_id': id}, (err, user) =>
    if err
      return done(err)
    
    if !user
      return done(erros.no_user_found, false)
    
    return done(null, user)
  )

login =  (values, done) ->
  User.findOne({'local.email': values.local.email}, (err, user) =>
    if err
      return done(err)

    if !user
      return done(errors.no_user_found, false)
    
    if !user.validPassword(values.local.password)
      return done(errors.wrong_password, false)

    return done(null, user)
  )

edit = (values, user, done) ->
  err = null
  
  validatePermissions = (values, user, done) ->
    if !user.isAuthenticated
      err = errors.permission_denied
      return done(err)
    User.findById(user._id, (err, doc) =>
      if err?
        console.log err
        err = errors.database_error
        return done(err)
      
      if !doc?
        err = errors.no_user_found
        return done(err)

      return done(null)
    )

    editUser = (user, values, done) ->
      editableFields = ['firstName', 'lastName', 'phone', 'city', 'county', 'address', 'postcode']
      for field in editableFields
        if values[field]?
          user[field] = values[field]
      
      user.save((err, doc) =>
        if err
          console.log err
          err = errors.database_error
          return done(err, doc)
        return done(err, doc)
      )

      async.waterfall([
        (done) =>
          validatePermissions(values, user, done) 
        (done) =>
          validateUserValues(user, done)
        (done) =>
          User.findById(user._id, done)
        (done) =>
          editUser(user, values, done)
      ], ((err, nrAffected) =>
        return done(err, nrAffected)
      ))

module.exports = {
  add: add
  edit: edit
  login: login
  one: one
}
