login = (req, res) ->
  res.render('login', {user: req.user, message: req.flash('loginMessage')})

signup = (req, res) ->
  res.render('signup', {user: req.user, message:req.flash('signupMessage')})

profile = (req, res) ->
  res.render('profile', {user: req.user})

edit = (req, res) ->
  console.log(req.user)
  res.render('edit', {user: req.user})

logout = (req, res) ->
  req.logout()
  res.redirect()

module.exports = {
  login: login
  signup: signup
  profile: profile
  edit: edit
  logout: logout
}
