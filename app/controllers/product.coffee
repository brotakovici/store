module.exports = (product) ->
  # TODO test, add view
  all = (req, res) ->
    product.getAll((err, doc) ->
      if err?
        console.log err
        res.send(500)
      else
        res.render('product/all', {user: req.user, products: doc})
    )

  view = (req, res) ->
    product.one(req.params.id, (err, doc) ->
      if err?
        res.send(err)
      if doc?
        res.sendStatus(500)

      res.render('product/view', {user: req.user, product: doc})
    )

  # TODO test, add view etc
  view = (req, res) ->
    productId = req.params.id
    product.getProduct(productId, (err, doc) ->
      if err?
        res.send(err)
      else
        res.render('product/view', {user: req.user, product: doc})
    )

  # TODO Need do add admin permission for this
  # This just returns the add product view
  add = (req, res) ->
    res.render('product/add', {user: req.user})

  # TODO admin check
  # Just returns the view
  edit = (req, res) ->
    productId = req.params.id
    product.getProduct(productId, (err, doc) ->
      if err?
        res.send(err)
      else
        res.render('product/edit', {user: req.user, product: doc})
    )

  return {
    all: all
    add: add
    view: view
    edit: edit
  }