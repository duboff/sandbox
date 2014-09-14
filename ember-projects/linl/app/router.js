import Ember from 'ember';

var Router = Ember.Router.extend({
  location: LinlENV.locationType
});

Router.map(function() {
  this.resource('user', { path: '/user' }, function() {
    this.resource('setup', function() {
      this.route('personal');
      this.route('residence');
      this.route('children');
      this.route('retirement');
      this.route('assets');
      this.route('assumptions');
      this.route('accounts');
    });
    this.route('protected');
  });
  this.route('login');
  this.route('registration');
  this.route('application');
});

export default Router;
