import Ember from 'ember';

export default Ember.ObjectController.extend({

  actions: {
    saveChanges: function(user, fields, nextRoute) {
      var _this = this
      if ( fields.residence.name ) {
        var residences = user.get('residences');

        if(residences.filterBy('name', fields.residence.name).length === 0) {
          fields.residence.user = user;
          var residence = this.store.createRecord('residence', fields.residence);
          residence.save().then(function() {
            _this.transitionToRoute(nextRoute);
          });
        }
      }
    }
  },

  hundredYears: Array.apply(null, {length: 100}).map(Number.call, Number),

  residence_types: ['Rent', 'Own'],
  residence_type: 'Own',
  owned: true,
  setOwn: function(key, value) {
    if(this.get(value) === 'Own') {
      this.set('owned', true);
    } else {
      this.set('owned', false);
    }
  }.observes('residence_type'),

});
