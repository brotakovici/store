module.exports = function (app, passport) {
  
  app.get('/', function (req, res) {
   console.log('test');
   res.render('index.jade');
  });

  app.get('/login', function (req, res) {
    res.render('login.jade', { message: req.flash('loginMessage') });
  });

  // Processing log-in form
  app.post('/login', passport.authenticate('local-login', {
    successRedirect: '/profile',
    failureRedirect: '/login',
    failureFlash: true
  }));
 

  app.get('/signup', function (req, res) {
    res.render('signup.jade', { message: req.flash('signupMessage') });
  });

  // Proccessing signup form
  app.post('/signup', passport.authenticate('local-signup', {
       successRedirect: '/profile',
       failureRedirect: '/signup',
       failureFlash: true
  }));

  app.get('/profile', isLoggedIn, function (req, res) {
    res.render('profile.jade', {
      user: req.user //get the user from the session
    });
  });

  app.get('/logout', function (req, res) {
    req.logout();
    res.redirect('/');
  });

  // Make sure the user is logged in
  function isLoggedIn (req, res, next) {
    if (req.isAuthenticated()) {
      return next();
    }

    res.redirect('/');
  };
};
