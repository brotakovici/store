var login = function (req, res) {
  res.render('login', {user: req.user, message: req.flash('loginMessage')}); 
};

var signup = function (req, res) {
  res.render('signup', {user: req.user, message: req.flash('signupMessage')});
};

var profile = function (req, res) {
  res.render('profile', {user:req.user});
};

var logout = function(req, res) {
  req.logout();
  res.redirect('/');
};

module.exports = {
  login: login,
  signup: signup,
  profile: profile,
  logout: logout
};
