user = require('./user_core')

edit = (req, res) ->
  console.log req.body
  user._id = req.body._id
  user.isAuthenticated = req.isAuthenticated()
  data = req.body
  user.edit(data, user, (err, doc) ->
    if err?
      console.log err
    if !doc
      console.log 'Nu e bine'
  )

one = (req, res) ->
  console.log req.body

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
