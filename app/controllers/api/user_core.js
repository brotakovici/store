User = require('../../models/user');
async = require('async');
errors = require('lib/errors');

var validateUserValuePresence = function (values, done) {
  var areAllFieldsCompleted = values.local !== 'undefined' && values.local !== 'null' && values.local.email !== 'undefined' && values.local.email !== 'null' && values.local.password !== 'undefined' && values.local.password !== 'null' && values.local.phoneNumber !== 'undefined' && values.local.password !== 'null' && values.local.city !== 'undefined' && values.local.city !== 'null' && values.local.county !== 'undefined' && values.local.county !== 'null' && values.local.address !== 'undefined' && values.local.address !== 'null' && values.local.postcode !== 'undefined' && values.local.postcode !== 'null'; 

  if(!areAllFieldsCompleted) {
    var err = errors.user_invalid_arguments;
    done(err);
  } else {
    done(null);
  }

};


