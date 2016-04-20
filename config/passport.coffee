LocalStrategy = require('passport-local').Strategy
User = require('../app/models/user')
roles = require('../app/lib/roles')

module.exports = (app, passport, userCore) ->

  passport.serializeUser((user, done) ->
    done(null, user.id)
  )

  passport.deserializeUser((id, done) ->
    User.findById(id, (err, user) ->
      done(err, user)
    )
  )

  passport.use('local-signup', new LocalStrategy({
      usernameField: 'email'
      passwordField: 'password'
      passReqToCallback: true
    }, (req, email, password, done) ->
      process.nextTick( ->
        values = {
          email: email
          password: password
        }
        userCore.signup(values, (err, doc) ->
          if err?
            return done(err, null)
          
          return done(err, doc)
        )
    )
  ))

  passport.use('local-login', new LocalStrategy({
    usernameField: 'email'
    passwordField: 'password'
    passReqToCallback: true
  }, (req, email, password, done) ->
    User.findOne({'email': email}, (err, user) ->
      if err
        return done(err)
      if not user
        return done(null, false, req.flash('loginMessage', 'Invalid user or password'))
      if not user.isValidPassword(password)
        return done(null, false, req.flash('loginMessage', 'Invalid user or password'))
      delete user.password
      return done(null, user)
      )
    )
  )