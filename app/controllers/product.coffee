Product = require('./api/product_core')

view = (req, res) ->
    productId = req.params.id
    Product.getProduct(productId, (err, doc) ->
        if err?
            res.send(err);
        else
            res.render('product/product', {user: req.user, product: doc})
    )
    
# TODO Need do add admin permission for this
#This just returns the add product view
add = (req, res) ->
    res.render('product/add', {user: req.user})

# TODO admin check
# Just returns the view
edit = (req, res) ->
    productId = req.params.id
    Product.getProduct(productId, (err, doc) ->
        if err?
            res.send(err)
        else
            res.render('product/edit', {user: req.user, product: doc})
    )
    
module.exports = {
    view: view
    add: add
    edid: edit
}