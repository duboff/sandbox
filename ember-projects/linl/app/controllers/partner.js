import Ember from 'ember';

export default Ember.ObjectController.extend({

  actions: {
    saveChanges: function() {
      console.log(this.get('fields'));
      this.get('model').save();
    }
  }

});
