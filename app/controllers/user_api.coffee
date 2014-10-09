user = require('./api/user_core')

edit = (req, res) ->
  console.log req.body

module.exports = {
  edit: edit
}
