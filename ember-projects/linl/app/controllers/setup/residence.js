import Ember from 'ember';

export default Ember.Controller.extend({
  //TODO duplicate code in saveChanges because parent not dirtied when child dirty
  needs: ['setup', 'residence'],

  curRoute: 'setup.residence',
  nextRoute: 'setup.children',
  setup: Ember.computed.alias('controllers.setup'),
  residence: Ember.computed.alias('controllers.residence')
});
