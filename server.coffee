express = require('express')
app = express()
port = process.env.port || 8080
passport = require('passport')
flash = require('connect-flash')
morgan = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
session = require('express-session')
dependencies = require('./app/dependencies')
factory = require('./app/factory')

app.use(morgan('dev'))
app.use(cookieParser())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))

app.set('views', './public/views')
app.set('view engine', 'jade')
app.use(express.static(__dirname + '/public'))
app.use(session({
  secret: 'amopulacatunprun'
  resave: true
  saveUninitialized: true
}))
app.use(flash())
app.use(passport.initialize())
app.use(passport.session())

dependencies = factory(dependencies)

require('./config/passport')(app, passport, dependencies.core_controllers.userCore)

require('./app/routes.coffee')(app, passport, dependencies)

app.listen(port, -> (
  console.log('Copii shukari se aduna pe localhost:' + port)
))