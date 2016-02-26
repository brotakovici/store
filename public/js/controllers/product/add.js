(function(){
  var elemId = document.getElementById('id');
  var elemName = document.getElementById('name');
  var elemDescription = document.getElementById('description');
  var elemQuantity = document.getElementById('quantity');
  var elemPrice = document.getElementById('price');

  var elemAddButton = document.getElementById('add-button');
  var elemCancelButton = document.getElementById('cancel-button');

  attachEventListener(elemAddButton, 'click', function(){
    var data = {
      //'createdById': elemId.value,
      'name': elemName.value,
      'description': elemDescription.value,
      'quantity': elemQuantity.value,
      'price': elemPrice.value
    };

    productService.addProduct(data, function(status, header, content) {
      document.location = '/profile';
    });
  });

  attachEventListener(elemCancelButton, 'click', function(){
    document.location = '/profile';
  });
})();
