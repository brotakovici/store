module.exports = () ->

  add = (values, done) ->
    if !values?
      return done("No values" , null)

    return done(null, {stuff: 'stuff'})

  edit = (user, values, done) ->
    return done()


  return {
    add: add
    edit: edit
    one: one
  }
