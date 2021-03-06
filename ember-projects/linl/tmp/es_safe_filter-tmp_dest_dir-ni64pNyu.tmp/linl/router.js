import Ember from 'ember';

var Router = Ember.Router.extend({
  location: LinlENV.locationType
});

Router.map(function() {
  this.resource('user', { path: '/user' }, function() {
    this.resource('setup', function() {
      this.route('personal');
      this.route('children');
      this.route('accounts');
    });
    this.route('protected');
  });
  this.route('login');
  this.route('application');
});

export default Router;
