import Ember from 'ember';

export default Ember.TextField.extend({
  type: 'currency',
  amount: function(amount) {
    if (amount) {
      this.set('value', accounting.unformat(amount));
    } else {
      var value = this.get('value');
      if (value) {
        amount = accounting.formatMoney(value);
      } else {
        amount = null;
      }
      return amount;
    }
  }.observes('value')
});
