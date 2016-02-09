var getCurrentUserDetails = function() {
  HTTPRequest.get('/user/self', function(status, header, content){
    content = JSON.parse(content);
    console.log(content);
    return content;
    
  });
};

var editUser = function(data, callback){
  HTTPRequest.put('/edit', data, callback);
};

var userService = {
  getCurrentUserDetails: getCurrentUserDetails,
  editUser: editUser
};
/*
if(typeof userService === 'object' && userService)
{
  module.exports = userService;
}*/
