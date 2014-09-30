import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      var user_fields = this.get('fields').get('user');
      this.get('model').update(user_fields);
    },
    saveChangesTransition: function() {
      var _this = this;
      var curPath = this.get('curPath');
      var paths = this.get('formPath')(curPath);
      this.set('curPath', paths.next);
      var nextPath = paths.next !== '' ? 'setup.'+paths.next : 'user';
      _this.transitionToRoute(nextPath);
      this.get('model').save().then(function() {
        //_this.transitionToRoute('setup.' + paths.next);
      });
    }
  },

  curPath: 'personal',
  formPath: function(curPath) {
    var paths = { personal: {prev: 'personal', next: 'residence'},
                  residence: {prev: 'personal', next: 'children'},
                  children: {prev: 'residence', next: 'retirement'},
                  retirement: {prev: 'children', next: 'assets'},
                  assets: {prev: 'retirment', next: 'assumptions'},
                  assumptions: {prev: 'assets', next: 'accounts'},
                  accounts: {prev: 'assumptions', next: ''}
                };

    return paths[curPath];
  },


  //residence
  residence_types: ['Rent', 'Own'],
  residence_type: 'Own',
  own: true,
  setOwn: function(key, value) {
    if(this.get(value) === 'Own') {
      this.set('own', true);
    } else {
      this.set('own', false);
    }
  }.observes('residence_type'),

  // children
  childVisible: false,

  //retirementAccounts
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
  }.observes('retirementAccount'),

  //assumptions
  assumptions: ["Special Expense", "Tax Hike", "Inflation"],
  assumptionType: "Special Expense",
  isSpecial: true,
  isTaxHike: false,
  isInflation: false,
  assumptionToggle: function(key, value) {
    function toggleAssumption(isSpecial, isTaxHike, isInflation) {
      this.set('isSpecial', isSpecial);
      this.set('isTaxHike', isTaxHike);
      this.set('isInflation', isInflation);
    }
    switch(this.get(value)) {
      case 'Special Expense':
        toggleAssumption.call(this, true, false, false);
        break;
      case 'Tax Hike':
        toggleAssumption.call(this, false, true, false);
        break;
      case 'Inflation':
        toggleAssumption.call(this, false, false, true);
        break;
      default:
        toggleAssumption.call(this, true, false, false);
        break;
    }
  }.observes('assumptionType')

});
