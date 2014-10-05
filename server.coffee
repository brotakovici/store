express = require('express')
app = express()
port = process.env.port || 8080
mongoose = require('mongoose')
passport = require('passport')
flash = require('connect-flash')
morgan = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
session = require('express-session')

mongoose.connect('mongodb://localhost/store')

app.use(morgan('dev'))
app.use(cookieParser())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))

app.set('view engine', 'jade')

app.use(session({
  secret: 'amopulacatunprun'
}))
app.use(flash())
app.use(passport.initialize())
app.use(passport.session())

require('./config/passport')(app, passport)

require('./app/routes.coffee')(app, routes)

app.listen(port, -> (
  console.log('Copii shukari se aduna pe localhost:' + port)
  ))
