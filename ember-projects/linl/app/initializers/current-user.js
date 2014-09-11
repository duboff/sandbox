import Ember from 'ember';
import Session from 'simple-auth/session';

export default {
  name: 'current-user',
  before: 'simple-auth',

  initialize: function(container, app) {
    app.deferReadiness();
    Session.reopen({
      setCurrentUser: function() {
        var id = this.get('user_id'), self = this;
        if (!Ember.isEmpty(id)) {
          return container.lookup('store:main').find('user', id)
          .then(function(user) {
            app.register('user:current', user, { instantiate: false, singleton: true });
            app.inject('route', 'currentUser', 'user:current');
            app.inject('controller', 'currentUser', 'user:current');
            app.advanceReadiness();
          }, function() {
            app.advanceReadiness();
          });
        }
      }.observes('user_id')
    });
  }
};
