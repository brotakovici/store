# TODO add api calls here
Product = require('./product_core')

add = (req, res) ->
  Product.add(req.body, (err, doc) ->
    if err?
      console.log err
      res.send(err)
    else
      res.sendStatus(200)
  )
    
module.exports = {
  add: add
}