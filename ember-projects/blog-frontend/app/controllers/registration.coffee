`import Ember from 'ember'`

RegistrationController = Ember.ObjectController.extend
  actions:
    createUser: ->
      console.log 'fields'
      console.log @get('fields')
      console.log 'user'
      console.log user
      user = @store.createRecord 'user', @get('fields')
      user.save().then =>
        @transitionToRoute 'users'

`export default RegistrationController`
