module.exports = (User, async, errors, validator, Product) ->

  addToWishlist = (id, productId, done) ->
    User.findOne({'_id': id}, (err, user) ->
      if err
        return done(err)

      if !user
        return done(errors.no_user_found)

      Product.findOne({'_id': productId}, (err, product)->
        if err
          return done(err)

        if !product
          return done(errors.no_product_found)

        user.wishlist.push(productId)
        return done(null, user)
      )
    )

  one = (id, done) ->
    User.findOne({'_id': id}, (err, user) ->
      if err
        return done(err)

      if !user
        return done(erros.no_user_found, false)

      user.password = "hue hue gotcha"
      return done(null, user)
    )

  signup = (values, done) ->
    validator.validateEmail(values, (err, values) ->

      if err?
        return done(err)

      User.findOne({'email': values.email}, (err, user) ->
        if err
          return done(err)

        if user
          return done(errors.user_exists)
        else
          newUser = new User
          newUser.email = values.email
          newUser.password = newUser.generateHash(values.password)
          newUser.role = roles.user

          newUser.save((err, doc) ->
            if(err)
              cosole.error(err, doc)
            return done(null, newUser)
          )
      )
    )


  login =  (values, done) ->

    validator.validateEmail(values, (err, values) ->
      if err?
        return done(err, null)

      User.findOne({'email': values.email}, (err, user) ->
        console.log user
        if err
          return done(err)

        if !user
          return done(errors.no_user_found, false)

        if !user.isValidPassword(values.password)
          return done(errors.wrong_password, false)

        return done(null, user)
      )
    )


  editUser = (user, values, done) ->
    editableFields = ['firstName', 'middleName', 'lastName', 'email', 'phone', 'city', 'county', 'address', 'postcode']
    for field in editableFields
      if values[field]?
        user[field] = values[field]

    user.save((err, doc) ->
      if err
        console.log err
        err = errors.database_error
        return done(err, doc)
      return done(err, doc)
    )

  edit = (values, user, done) ->
    err = null
    existingUser = null

    User.findById(user._id, (err, doc) ->
      if err?
        console.log err
      else
        existingUser = doc

      editableFields = ['firstName', 'middleName', 'lastName', 'email', 'phone', 'city', 'county', 'address', 'postcode']
      for field in editableFields
        console.log values[field]
        if values[field]?
          existingUser[field] = values[field]

      existingUser.save((err, doc) ->
        if err?
          console.log err
        else
          console.log "Success!"
          return done(null, doc)
      )
    )

  return {
    signup: signup
    edit: edit
    login: login
    one: one
  }