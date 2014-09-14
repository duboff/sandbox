import Ember from 'ember';

export default Ember.Route.extend( {
  setupController: function(controller) {
    var model = this.modelFor('user');
    if (model.get('partner').objectAt(0) !== undefined) {
      if (model.get('partner').objectAt(0).get('married')) {
        controller.set('partner_status', 'Spouse');
      } else {
        controller.set('partner_status', 'Partner');
      }
    }
    if (model.get('children').objectAt(0) !== undefined) {
      controller.set('childVisible', true);
    }
    controller.set('model', model);
    controller.set('fields', {partner: {}, child: {}, residence: {}});
  }
});
