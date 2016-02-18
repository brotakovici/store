LocalStrategy = require('passport-local').Strategy
User = require('../app/models/user')
roles = require('../app/lib/roles')

module.exports = (app, passport) -> 
  
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
        User.findOne({'email': email}, (err, user) =>
          if err
            return done(err)

          if user
            return done(null, false, req.flash('signupMessage', 'Email is already taken'))
          else
            newUser = new User
            newUser.email = email
            newUser.password = newUser.generateHash(password)
            newUser.role = roles.user

            newUser.save((err, doc) ->
              if(err)
                cosole.error(err, doc)
              delete newUser.password
              return done(null, newUser)
            )
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

