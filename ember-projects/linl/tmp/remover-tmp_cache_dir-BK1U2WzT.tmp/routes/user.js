import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    console.log(this.container.lookup('user:current'));
    return this.container.lookup('user:current');
  }
});
