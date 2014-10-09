module.exports = (app, passport) ->
  
  isLoggedIn = (req, res, next) ->
    if req.isAuthenticated()
      return next()
    res.redirect('/')

  alreadyLogged = (req, res, next) ->
    if req.isAuthenticated()
      res.redirect('/profile')
    return next()

  pages = {
    user: require('./controllers/user')
    home: require('./controllers/home')
  }
  
  api = {
    user: require('./controllers/user_api')
  }
  app.get('/', alreadyLogged, pages.home)
  app.get('/login', pages.user.login)
  app.post('/login', passport.authenticate('local-login', {
    successRedirect: '/profile'
    failureRedirect: '/login'
    failueFlash: true
  }))

  app.get('/signup', pages.user.signup)
  app.post('/signup', passport.authenticate('local-signup', {
    successRedirect: '/profile'
    failureRedirect: '/login'
    failueFlash: true
  }))

  app.get('/profile', isLoggedIn, pages.user.profile)
  app.get('/logout', pages.user.logout)
  app.get('/edit', isLoggedIn, pages.user.edit)

  #API
  app.put('/edit', isLoggedIn, api.user.edit)
