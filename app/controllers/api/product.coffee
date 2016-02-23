###
product = require('./product_core')
###

module.exports = (product) ->
  add = (req, res) ->
    product.add(req.body, (err, doc) ->
      if err?
        console.log err
        res.send(err)
      else
        res.sendStatus(200)
    )