import Ember from 'ember';

export default Ember.ObjectController.extend({
  actions: {
    saveChanges: function() {
      console.log(this.get('fields'));
      this.get('model').save();
    }
  },

  states: [ {label: "AL", value: 1}, {label: "AK", value: 2}, {label: "AZ", value: 3}, {label: "AR", value: 4}, {label: "CA", value: 5}, {label: "CO", value: 6}, {label: "CT", value: 7}, {label: "DE", value: 8}, {label: "DC", value: 9},
            {label: "FL", value: 10}, {label: "GA", value: 11}, {label: "HI", value: 12}, {label: "ID", value: 13}, {label: "IL", value: 14}, {label: "IN", value: 15}, {label: "IA", value: 16}, {label: "KS", value: 17}, {label: "KY", value: 18}, {label: "LA", value: 19},
            {label: "ME", value: 20}, {label: "MD", value: 21}, {label: "MA", value: 22}, {label: "MI", value: 23}, {label: "MN", value: 24}, {label: "MS", value: 25}, {label: "MO", value: 26}, {label: "MT", value: 27}, {label: "NE", value: 28}, {label: "NV", value: 29},
            {label: "NH", value: 30}, {label: "NJ", value: 31}, {label: "NM", value: 32}, {label: "NY", value: 33}, {label: "NC", value: 34}, {label: "ND", value: 35}, {label: "OH", value: 36}, {label: "OK", value: 37}, {label: "OR", value: 38}, {label: "PA", value: 39},
            {label: "RI", value: 40}, {label: "SC", value: 41}, {label: "SD", value: 42}, {label: "TN", value: 43}, {label: "TX", value: 44}, {label: "UT", value: 45}, {label: "VT", value: 46}, {label: "VA", value: 47}, {label: "WA", value: 48}, {label: "WV", value: 49},
            {label: "WI", value: 50}, {label: "WY", value: 51 } ],

  hundredYears: Array.apply(null, {length: 100}).map(Number.call, Number),

  partnerVisible: false,
  partner_status: '',
  partner_statuses: ['', 'Partner', 'Spouse'],
  isPartnerVisible: function(key, value) {
    if(this.get(value) !== '') {
      this.set('partnerVisible', true);
    } else {
      this.set('partnerVisible', false);
    }
  }.observes('partner_status')
});
