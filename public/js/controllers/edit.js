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

  var emptyIfNull = function(string){
    if(string == null || string == 'undefined')
      return '';
    else 
      return string;
  };


  userService.getCurrentUserDetails(function(content){
    elemFirstName.value = emptyIfNull(content.firstName);
    elemMiddleName.value = emptyIfNull(content.middleName);
    elemLastName.value = emptyIfNull(content.lastName);
    elemEmail.value = emptyIfNull(content.email);
    elemPhone.value = emptyIfNull(content.phone);
    elemAddress.value = emptyIfNull(content.address);
    elemCity.value = emptyIfNull(content.city);
    elemCounty.value = emptyIfNull(content.county);
    elemPostcode.value = emptyIfNull(content.postcode);
  });
    
  // Buttons!
  var elemSaveBtn = document.getElementById('save-button');
  var elemCancelBtn = document.getElementById('cancel-button');

  attachEventListener(elemSaveBtn, 'click', function(){
    var data = {
      '_id': elemId.value, 
      'firstName': elemFirstName.value,
      'lastName': elemLastName.value,
      'middleName': elemMiddleName.value,
      'email': elemEmail.value,
      'phone': elemPhone.value,
      'address': elemAddress.value,
      'city': elemCity.value,
      'county': elemCounty.value,
      'postcode': elemPostcode.value
    };
    
    userService.editUser(data, function(status, header, content){
      document.location = '/profile';
    });
  });

  attachEventListener(elemCancelBtn, 'click', function(){
    document.location = "/profile"; 
  });

})();
