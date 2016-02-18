Product = require('./api/product_core')

view = (req, res) =>
    #View will be returned with the product, depending on the get id passed 
    # through url
    
module.exports = {
    view: view
}