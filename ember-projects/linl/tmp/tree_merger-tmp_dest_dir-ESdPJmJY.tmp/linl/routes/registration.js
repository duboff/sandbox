import Ember from 'ember';

export default Ember.Route.extend({
  setupController: function(controller) {
    controller.set('model', this.store.createRecord('user'));
    controller.set('fields', {});
  }
});
