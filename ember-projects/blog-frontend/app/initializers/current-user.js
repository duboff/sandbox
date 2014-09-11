import Session from 'simple-auth/session';

export default {
  name: 'simple-auth-config',
  before: 'simple-auth',
  initialize: function(container) {
    Session.reopen({
      updateCurrentUser: function() {
        var self = this;
        var currentUser_id = self.get('user_id');
        if(currentUser_id) {
          container.lookup('store:main').find('user', currentUser_id).then(function(user){
            self.set("currentUser", user);
          });
        } else {
          container.lookup('store:main').find('user', 'current').then(function(user){
            self.set("currentUser", user);
          });
        }
      }.observes('user_id')
    });
  }
};
