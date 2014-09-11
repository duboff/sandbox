import Ember from 'ember';

var Router = Ember.Router.extend({
  location: LinlENV.locationType
});

Router.map(function() {
  this.resource('user', { path: '/users/:user_id' });
  this.route('protected');
  this.route('login');
  this.route('application');
});

export default Router;
