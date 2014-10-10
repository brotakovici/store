user = require('./user_core')

edit = (req, res) ->
  req.body.user = JSON.parse(req.body.user)
  req.user.isAthenticated = req.isAuthenticated()
  user.edit(req.body, req.user, (err, doc) ->
    if err?
      console.log err
    if !doc
      console.log 'Nu e bine'
  )

module.exports = {
  edit: edit
}
