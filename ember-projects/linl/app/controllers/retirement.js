import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      this.get('model').save();
    }
  },

  retirementAccounts: ['Pension', '401k', 'Roth', 'Social Security'],
  retirementAccount: '401k',
  order: ['first', 'last'],
  isPension: false,
  isIRA: true,
  isSS: false,
  rothVisible: false,
  collecting: false,
  benefitsCut: false,
  retirementToggle: function(key, value) {
    function updateRetirementView(isPen, is401k, isRoth, isSS) {
      this.set('isPension', isPen);
      this.set('isIRA', is401k);
      this.set('isRoth', isRoth);
      this.set('isSS', isSS);
    }
    switch(this.get(value)) {
      case 'Pension':
        updateRetirementView.call(this, true, false, false, false);
        break;
      case '401k':
        updateRetirementView.call(this, false, true, false, false);
        break;
      case 'Roth':
        updateRetirementView.call(this, false, true, true, false);
        break;
      case 'Social Security':
        updateRetirementView.call(this, false, false, false, true);
        break;
      default:
        updateRetirementView.call(this, true, false, false, false);
        break;
    }
  }.observes('retirementAccount')

});
