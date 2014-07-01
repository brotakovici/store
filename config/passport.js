var LocalStrategy = require('passport-local').Strategy;
var User = require('../app/models/user');

module.exports= function (passport) {
  
  passport.serializeUser(function (user, done) {
    done(null, user.id);
  });

  passport.deserializeUser( function (id, done) {
    User.findById (id, function (err, user) {
      done(err, user);
    });
  });

  passport.use ('local-signup', new LocalStrategy({
      username : 'email',
      password : 'password',
      passReqToCallback : true
    },
  
    function (req, email, password, done) {
      process.nextTick(function () {
        User.findOne({'local.email' : email}, function (err, user) {
           
          if (err) { 
          return done(err);
          } 
          
          if (user) {
            return done(null, false, req.flash('signupMessage', 'Email is already taken'));  
          } else {
            var newUser = new User();
            newUser.local.email = email;
            newUser.local.password = newUser.generateHash(password);

            // Save the user
            newUser.save(function (err){
              if (err) {
                throw err;
              }
              return done(null, newUser);
            });
          }
        });
      });
    }));
};
