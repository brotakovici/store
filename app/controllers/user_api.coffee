user = require('./api/user_core')

edit = (req, res) ->
  req.body.user = JSON.parse(req.body.user)
  req.user.isAthenticated = req.isAuthenticated()
module.exports = {
  edit: edit
}
