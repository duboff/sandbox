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
      fields.user.id = model.id;
      var user_fields = fields.user;
      console.log(fields);
      model.update(fields);
      model.save();
  /*    var curPath = this.get('curPath');
      var paths = this.get('formPath')(curPath);
      this.set('curPath', paths.next);
      var nextPath = paths.next !== '' ? 'setup.'+paths.next : 'user';
      _this.transitionToRoute(nextPath);
      this.get('model').save().then(function() {
        //_this.transitionToRoute('setup.' + paths.next);
      });
      */
    }
  },

  setup: Ember.computed.alias('controllers.setup'),
  user: Ember.computed.alias('controllers.user'),
  partner: Ember.computed.alias('controllers.partner')
});
