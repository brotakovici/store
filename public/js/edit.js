(function(){
// Inputs!
var elemId = document.getElementById('id');
var elemFirstName = document.getElementById('firstName');  
var elemMiddleName = document.getElementById('middleName');  
var elemLastName = document.getElementById('lastName');  
var elemEmail = document.getElementById('email');  
var elemPhone = document.getElementById('phone');  
var elemAddress = document.getElementById('address');  
var elemCity = document.getElementById('city');  
var elemCounty = document.getElementById('county');  
var elemPostcode = document.getElementById('postcode');  

var getCurrentUserDetails = function() {
  HTTPRequest.get('/user/self', function(status, header, content){
    content = JSON.parse(content);
    elemFirstName.value = content.firstName;
    elemMiddleName.value = content.middleName;
    elemLastName.value = content.lastName;
    elemEmail.value = content.local.email;
    elemPhone.value = content.phone;
    elemAddress.value = content.address;
    elemCity.value = content.city;
    elemCounty.value = content.county;
    elemPostcode.value = content.postcode;
    
  });
};

getCurrentUserDetails();
  

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
