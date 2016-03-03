expect = require('chai').expect
dependencies = require('../app/dependencies')
core_mock = require('./mocks/user_core_mock')
userController = {}


before(() ->
  userController = dependencies.api_controllers.user(core_mock)
)

beforeEach(() ->
  # dunno whats in here yet
)

describe('User API Controller', () ->
  user = dependencies.api_controllers.user
  
  describe('self', () ->
  
  )
  
  describe('edit', () ->
  
  )
  
  describe('one', () ->
  
  )
)