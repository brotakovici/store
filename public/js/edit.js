(function(){

var getCurrentUserDetails = function() {
  HTTPRequest.get('/user/self', function(status, header, content){
    console.log(content);
  });
};

getCurrentUserDetails();
  
// Inputs!
var elemId = document.getElementById('id');
var elemName = document.getElementById('name');  
var elemEmail = document.getElementById('email');  
var elemPhone = document.getElementById('phone');  
var elemAddress = document.getElementById('address');  
var elemCity = document.getElementById('city');  
var elemCounty = document.getElementById('county');  
var elemPostcode = document.getElementById('postcode');  

// Buttons!
var elemSaveBtn = document.getElementById('save-button');
var elemCancelBtn = document.getElementById('cancel-button');

attachEventListener(elemSaveBtn, 'click', function() {
  
  var data = {
    '_id': elemId.value, 
    'name': elemName.value,
    'local.email': elemEmail.value,
    'phone': elemPhone.value,
    'address': elemAddress.value,
    'city': elemCity.value,
    'county': elemCounty.value,
    'postcode': elemPostcode.value
  };
  
  console.log(data);

  HTTPRequest.put('/edit', data, function(status, header, content){
    // Error management goes here!!
    document.location = '/profile';
  });
});

attachEventListener(elemCancelBtn, 'click', function (){
  document.location = "/profile"; 
});

})();
