import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  type: DS.attr('string'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  monthly_cents: DS.attr('number'),
  total_cents: DS.attr('number'),
  contributions_cents: DS.attr('number'),
  employer_contributions_cents: DS.attr('number'),

  ownerships: DS.hasMany('ownership'),

  user: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.mapBy('user');
    });
  }.property('ownerships.@each.user'),

  partner: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.mapBy('partner');
    });
  }.property('ownerships.@each.partner')

});
