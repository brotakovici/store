var express = require('express');
var app = express();
var port = process.env.PORT || 8080;
var mongoose = require('mongoose');
var passport = require('passport');
var flash = require('connect-flash');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');

mongoose.connect('mongodb://localhost/store');

require('./config/passport')(passport);// Pass passport for configuraiton

app.use(morgan('dev'));// Log every request to console
app.use(cookieParser());// Read from cookies, needed for authentication
app.use(bodyParser.json());// Get stuff from HTML forms 
app.use(bodyParser.urlencoded({
  extended : true
}));

app.set('view engine', 'jade');// Jade for templating

// Passport stuff
app.use(session({ secret: 'amopulacatunprun'})); 
app.use(passport.initialize());
app.use(passport.session());// Persistent login session
app.use(flash());// Use connect-flash for flash messages stored in session

// Routes
require('./app/routes.js')(app, passport);

app.listen(port, function() {
  console.log('Copii shukari se aduna pe localhost:' + port);
});
