import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    createUser: function () {
      var user = this.store.createRecord('user', this.get('fields'));
      var _this = this;
      user.save().then(function() {
        return _this.transitionToRoute('user');
      });
    }
  }
});
