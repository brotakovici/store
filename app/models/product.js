var mongoose = require('mongoose');

var productSchema = mongoose.Schema({
  product : {
    name : String,
    quantity : Number,
    price : Number,
  },
});

module.exports = mongoose.model('Product', productSchema, 'product');
