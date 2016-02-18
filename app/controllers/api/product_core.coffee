# This file here will handle all product related db operations and shit
Product = require('../../models/product')

getProduct = (id, done) ->
    Product.findOne({'_id': id}, (err, doc) ->
        if err?
            console.log err
            done(err, null)
        
        done(null, doc)
    )

module.exports = {
    getProduct: getProduct
}