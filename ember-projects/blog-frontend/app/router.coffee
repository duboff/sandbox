`import Ember from 'ember'`

Router = Ember.Router.extend
  location: BlogFrontendENV.locationType

Router.map ->
  @route 'home'
  @route 'login'
  @route 'protected'
  @route 'protected2'
  @route 'registration'
  @resource 'users'
  @resource 'user', { path: 'users/:user_id' }, ->
    @resource 'posts', { path: '/posts' }, ->
      @resource 'post', { path: '/:post_id' }
    
  @route 'users/new'

`export default Router`
