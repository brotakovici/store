module.exports = (product) ->
  add = (req, res) ->
    product.add(req.body, (err, doc) ->
      if err?
        console.log err
        res.send(err)
      else
        res.sendStatus(200)
    )

  edit = (req, res) ->
    product.edit(req.body, (err, doc) ->
      if err?
        console.log err
        res.send(err)
      else
        res.sendStatus(200)
    )

  upload = (req, res) ->
    return "to be continued"

  return {
    add: add
    edit: edit
    upload: upload
  }