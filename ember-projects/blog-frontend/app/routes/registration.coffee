`import Ember from 'ember'`

RegistrationRoute = Ember.Route.extend

  setupController: (controller) ->
    controller.set 'model', @store.createRecord('user')
    controller.set 'fields', {}

`export default RegistrationRoute`
