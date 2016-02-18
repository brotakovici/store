var addProduct = function(data, callback){
  HTTPRequest.put('/product/add', data, callback);
};

var productService = {
  addProduct: addProduct
};
