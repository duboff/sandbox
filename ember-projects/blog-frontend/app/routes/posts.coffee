`import Ember from 'ember'`

PostsRoute = Ember.Route.extend
  model: ->
    @modelFor('user').get('posts')

`export default PostsRoute`
