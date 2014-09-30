import Ember from 'ember';
export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      this.get('model').save();
    }
  },

  states: [ "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC",
            "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA",
            "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV",
            "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA",
            "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV",
            "WI", "WY" ],

  hundredYears: Array.apply(null, {length: 100}).map(Number.call, Number),

  partnerVisible: false,
  partner_status: '',
  partner_statuses: ['', 'Partner', 'Spouse'],
  isPartnerVisible: function(key, value) {
    var val = this.get(value);
    if(val !== '') {
      if (val === 'Spouse') {
        this.get('fields').get('user').set('marital_status', true);
      }
      this.set('partnerVisible', true);
    } else  {
      this.set('partnerVisible', false);
    }
  }.observes('partner_status')

});
