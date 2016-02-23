module.exports = (Product, validator) ->
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
  
  return {
    add: add
    getAll: getAll
    getProduct: getProduct
  }