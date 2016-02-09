user = require('./user_core')

#Edits a user.
edit = (req, res) ->
  user._id = req.body._id
  user.isAuthenticated = req.isAuthenticated()
  data = req.body
  user.edit(data, user, (err, doc) ->
    if err?
      console.log err
    if !doc
      console.log 'Nu e bine'
    console.log doc
  )

one = (req, res) ->
  console.log req.body

#Gets user details for logged in user using id stored in session.
self = (req, res) ->
  user.one(req.user._id, (err, doc) ->
    if err?
      console.log err
    else
      res.send(doc)
  )

module.exports = {
  edit: edit
  one: one
  self: self
}
