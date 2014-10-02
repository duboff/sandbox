import Ember from 'ember';

export default Ember.ObjectController.extend({

  actions: {
    saveChanges: function() {
      this.get('model').save();
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
