import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      console.log(this.get('fields'));
      this.get('model').save();
    }
  },

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
