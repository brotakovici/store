var getCurrentUserDetails = function(callback) {
  HTTPRequest.get('/user/self', function(status, header, content){
    content = JSON.parse(content);
    return callback(content);
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
