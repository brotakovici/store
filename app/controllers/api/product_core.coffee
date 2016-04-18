module.exports = (Product, userCoreValidator) ->

  getAll = (done) ->
    Product.find({}, (err, doc) ->
      if err?
        return done(err, null)
      else
        return done(null, doc)
    )

  getProduct = (id, done) ->
    Product.findOne({'_id': id}, (err, doc) ->
      if err?
        console.log err
        return done(err, null)

      return done(null, doc)
    )

  add = (data, done) ->

    product = new Product({
      name: data.name
      quantity: data.quantity
      price: data.price
      description: data.description
    })

    product.save((err, doc) ->
      if err?
        console.log err
        return done(err, null)
      else
        return done(null, doc)
    )

  mapProduct = (product, values) ->
    product.name = values.name
    product.quantity = values.quantity
    product.price = values.price
    product.description = values.description

    return product

  edit = (data, done) ->
    Product.findOne(data.id, (err, doc) ->
      if err?
        done(err, null)

      if doc?
        done(null, null)

      product = mapProduct(doc, data)
      product.save((err, doc) ->
        if err?
          return done(err, null)
        if doc?
          return done(null, null)

        return done(null, doc)
      )
    )

  return {
    add: add
    edit: edit
    getAll: getAll
    getProduct: getProduct
  }