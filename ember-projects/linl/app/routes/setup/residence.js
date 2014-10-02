import Ember from 'ember';

export default Ember.Route.extend({
  setupController: function(controller) {
    var model = this.modelFor('user');
    controller.set('model', model);
    controller.set('fields', { residence: {} });
  }
});
