`import Ember from 'ember'`

UserRoute = Ember.Route.extend
  model: (params) ->
    @store.find('user', params.user_id)
  

`export default UserRoute`
