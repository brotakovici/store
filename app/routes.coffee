module.exports = (app, passport) -> 
  pages = {
    user: require('./controllers/user.coffee')
    home: require('./controllers/home.coffee')
  }
  app.get('/', pages.home)
  app.get('/login', pages.user.login)
  app.post('/login', passport.authenticate('local-login', {
    succesRedirect: '/profile'
    failureRedirect: '/login'
    failueFlash: true
  }))

  app.get('/signup', pages.user.signup)
  app.post('/signup', passport.authenticate('local-signup', {
    succesRedirect: '/profile'
    failureRedirect: '/login'
    failueFlash: true
  }))

  app.get('/profile', isLoggedIn, pages.user.profile)
  app.get('/logout', pages.user.logout)

  isLoggedIn = (req, res, next) ->
    if req.isAuthenticated()
      return next()
    res.redirect('/')
