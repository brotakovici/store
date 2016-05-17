Mongoose = require('mongoose').Mongoose
mongoose = new Mongoose()

mockgoose = require('mockgoose')
mockgoose(mongoose)

before(() ->
  mongoose.connect('mongodb://localhost/storeTest', (err) ->
    console.log err
  )
)

beforeEach(() ->
  describe('User API Core', () ->
    user = dependencies.api_controllers.user

    describe('self()', () ->
      it('should return own user', () ->

      )
    )

    describe('edit()', () ->
      it('should edit the user', () ->

      )

      it('should throw error on invalid values', () ->

      )

      it('should throw error on no user found', () ->

      )

    )

    describe('one()', () ->
      it('should return user based on id', () ->

      )

      it('should throw an error on no user', () ->

      )
    )

    describe('signup()', () ->
      it('should return user on success', () ->

      )

      it('should throw error on email already in use', () ->

      )

      it('should throw error on no password', () ->

      )
    )

    describe('login()', () ->
      it('should return user on success', () ->

      )

      it('should throw error on invalid email', () ->

      )

      it('should throw error on invalid password', () ->

      )

      it('should throw error on no email', () ->

      )

      it('should throw error on no password', () ->

      )
    )
  )
)