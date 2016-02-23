###
user = require('./user_core')
###

module.exports = (user) ->
  #Edits a user.
  edit = (req, res) ->
    user._id = req.body._id
    user.isAuthenticated = req.isAuthenticated()
    data = req.body
    user.edit(data, user, (err, doc) ->
      if err?
        console.log err
        return res.send(err)
      if !doc
        console.log 'Nu e bine'
      return res.sendStatus(200)
    )
  
  one = (req, res) ->
    console.log req.body
  
  #Gets user details for logged in user using id stored in session.
  self = (req, res) ->
    user.one(req.user._id, (err, doc) ->
      if err?
        console.log err
        res.sendStatus(500)
      else
        res.send(doc)
    )
  
  return {
    edit: edit
    one: one
    self: self
  }