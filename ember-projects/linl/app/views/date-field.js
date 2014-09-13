import Ember from 'ember';

export default Ember.TextField.extend({
  type: 'date',
  date: function(key, date) {
    if (date) {
      this.set('value', date.toISOstring().substring(0, 10));
    } else {
      var value = this.get('value');
      if (value) {
        date = new Date(value);
      } else {
        date = null;
      }
      return date;
    }
  }.observes('value')
});
