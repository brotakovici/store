Product = require('./api/product_core')

view = (req, res) =>
    productId = req.params.id
    Product.getProduct(productId, (err, doc) ->
        if err?
            res.send(err);
        else
            res.render('profile', {user: req.user, product: doc})
    )
    
module.exports = {
    view: view
}