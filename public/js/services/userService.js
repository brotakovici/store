var getCurrentUserDetails = function() {
  HTTPRequest.get('/user/self', function(status, header, content){
    content = JSON.parse(content);
    console.log(content);
    return content;
    
  });
};

var userService = {
  getCurrentUserDetails: getCurrentUserDetails
};
/*
if(typeof userService === 'object' && userService)
{
  module.exports = userService;
}*/
