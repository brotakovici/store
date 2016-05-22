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
    it('should return own user', () ->

    )
  )

  describe('edit', () ->
    it('should edit the user', () ->

    )

    it('should throw error on invalid values', () ->

    )

    it('should throw error on no user found', () ->

    )

  )

  describe('one', () ->
    it('should return user based on id', () ->

    )

    it('should throw an error on no user', () ->

    )
  )
)