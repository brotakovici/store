user = require('./user_core')

edit = (req, res) ->
  console.log req.body
  #req.body.user = JSON.parse(req.body)
  req.user.isAthenticated = req.isAuthenticated()
  user.edit(req.body, req.body, (err, doc) ->
    if err?
      console.log err
    if !doc
      console.log 'Nu e bine'
  )

module.exports = {
  edit: edit
}
