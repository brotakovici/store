
module.exports = function (app, passport) {
  var pages = {
    user: require('./controllers/user.js'),
    home: require('./controllers/home.js')
  }
  app.get('/', pages.home);

  app.get('/login', pages.user.login); 

  // Processing log-in form
  app.post('/login', passport.authenticate('local-login', {
    successRedirect: '/profile',
    failureRedirect: '/login',
    failureFlash: true
  }));
 

  app.get('/signup', pages.user.signup); 

  // Proccessing signup form
  app.post('/signup', passport.authenticate('local-signup', {
       successRedirect: '/profile',
       failureRedirect: '/signup',
       failureFlash: true
  }));

  app.get('/profile', isLoggedIn, pages.user.profile); 

  app.get('/logout', pages.user.logout); 

  // Make sure the user is logged in
  function isLoggedIn (req, res, next) {
    if (req.isAuthenticated()) {
      return next();
    }

    res.redirect('/');
  };
};
