import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['setup', 'residence'],

  actions: {
    saveChanges: function() {
      var fields = this.get('fields');
      if ( fields.residence.name ) {
        var model = this.get('model');
        if(model.get('residences').filterBy('name', fields.residence.name).length === 0) {
          fields.residence.user = model;
          var residence = this.store.createRecord('residence', fields.residence);
          model.get('residences').pushObject(residence);
          console.log(model);
          console.log(model.get('residences'));
          //model.save();
        }
      }
    },
    saveChangesTransition: function() {
      var _this = this, fields = this.get('fields'), model = this.get('model');
      console.log(fields);
      /*if ( fields.residence.name ) {
        var residences = model.get('residences');

        fields.residence.user = model;
        residence = this.store.createRecord('residence', fields.residence);
        residences.pushObject(residence);

        model.save().then(function() {
          _this.transitionToRoute('setup.children');
        });
      }*/
    }
  },


  setup: Ember.computed.alias('controllers.setup'),
  residence: Ember.computed.alias('controllers.residence')
});
