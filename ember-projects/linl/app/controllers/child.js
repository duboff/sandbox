import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      this.get('model').save();
    }
  },

  childVisible: false

});
