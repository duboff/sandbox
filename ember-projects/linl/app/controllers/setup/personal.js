import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['setup', 'user', 'partner'],

  actions: {
    saveChanges: function() {
      var user_fields = this.get('fields').get('user');
      this.get('model').update(user_fields);
    },
    saveChangesTransition: function() {
      var _this = this;
      var fields = this.get('fields');
      var model = this.get('model');
      var partner = model.get('partner');
      if ( fields.partner.name ) {
        if (!partner) {
          fields.partner.user = model;
          partner = this.store.createRecord('partner', fields.partner);
        } else {
          partner.setProperties(fields.partner);
          fields.user.partner = partner;
        }
      }

      model.setProperties(fields.user);
      model.save().then(function() {
        _this.transitionToRoute('setup.residence');
      });
    }
  },

  setup: Ember.computed.alias('controllers.setup'),
  user: Ember.computed.alias('controllers.user'),
  partner: Ember.computed.alias('controllers.partner')
});
