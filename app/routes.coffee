module.exports = (app, passport, dependencies) ->

  isLoggedIn = (req, res, next) ->
    if req.isAuthenticated()
      return next()
    res.redirect('/')

  alreadyLogged = (req, res, next) ->
    if req.isAuthenticated()
      res.redirect('/profile')
    return next()

  pages = {
    user: dependencies.view_controllers.user
    home: dependencies.view_controllers.home
    product: dependencies.view_controllers.product
  }

  api = {
    user: dependencies.api_controllers.user
    product: dependencies.api_controllers.product
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

  # User stuff
  app.get('/profile', isLoggedIn, pages.user.profile)
  app.get('/logout', pages.user.logout)
  app.get('/edit', isLoggedIn, pages.user.edit)

  # Product stuff
  app.get('/products', pages.product.all)
  app.get('/product/view/:id', pages.product.view)
  app.get('/product/edit/:id', isLoggedIn, pages.product.edit)
  app.get('/product/add', isLoggedIn, pages.product.add)
  app.put('/product/add', isLoggedIn, api.product.add)

  # API
  app.put('/edit', isLoggedIn, api.user.edit)
  app.get('/user/self/', isLoggedIn, api.user.self)